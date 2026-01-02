import { defineStore } from "pinia";
import api from "../plugins/axios";
import { errorHandler } from "@/services/responseHandleService";
import { toRaw } from "vue";
import { useCartStore } from "@/stores/cartStore";

export const useUserStore = defineStore("user", {
    state: () => ({
        is_logged_in: false,        
        user: {},
        loading: false,
        token: localStorage.getItem('auth_token'),
    }),

    getters: {

    },

    actions: {
        // ==============================
        // LOGIN
        // ==============================
        async loginRequest(data){
            try {
                const form = new FormData();
                form.append("email", data.email);
                form.append("password", data.password);
                const res = await api.post("/api/auth/login", form);
                if (!res.data?.data?.token) {
                    throw new Error("Token Not Found");
                }
                return res.data.data;
            } catch (error) {
                throw await errorHandler(error);
            }
        },
        // ==============================
        // REGISTER
        // ==============================
        async registerRequest(data){
            try {
                const form = new FormData();
                for (const key in data) {
                    if (!Object.hasOwn(data, key)) continue;
                    form.append(key,data[key]);
                }
                const res = await api.post("/api/auth/register",form);
                return res.data.data;

            } catch (error) {
                throw await errorHandler(error);
            }
        },
          // ==============================
        // INITIALIZE SESSION
        // ==============================
       async initializeUserSession(token, data) {  
           
           try {
                
                if(!token) {
                    throw new Error("Token Not Found");
                }
               
                api.defaults.headers.common["Authorization"] = `Bearer ${token}`;
                localStorage.setItem("auth_token", token);
                this.token = token;
                this.user = data;
                this.is_logged_in = true;

                 const cartStore = useCartStore();
                 cartStore.mergeGuestIntoUser(data.id);
            } catch (error) {
                throw await errorHandler(error);
           } 
        },
        // ==============================
        // GET PROFILE
        // ==============================
       async getProfile() {
    const token = localStorage.getItem("auth_token");

    if (!token) {
        throw new Error("Token Not Found");
    }

    try {
        api.defaults.headers.common["Authorization"] = `Bearer ${token}`;
        const res = await api.get("/api/auth/profile");

        this.user = res.data.data.user || res.data.data;
        this.is_logged_in = true;
        this.token = token;

        return res.data.data;
    } catch (error) {
        throw await errorHandler(error);
    }
},

        // ==============================
        // LOGOUT
        // ==============================
        async logOut(token){
            
            //clear API Auth
            api.defaults.headers.common["Authorization"] = "";

            //clear User Store
            localStorage.removeItem("auth_token");


            //reset user store
            this.is_logged_in = false;
            this.user = {};
            this.token = null;
        },
       

    },

});
