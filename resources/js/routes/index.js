
import { createRouter, createWebHistory } from 'vue-router';
import { useUserStore } from '@stores/userStore';
import { useAlertStore } from '@stores/alertStore';




// Routes...
import Webroute from "./Webroute"
import Layout from "@views/user/layout/index.vue";
import Login from '@/views/auth/login.vue';
import NotFound from "@views/user/404.vue"
import Dashboard from '@views/user/dashboard/index.vue';
import Register from '@/views/auth/register.vue';
import Shop from "@/views/web/shop.vue"
import ShopDetail from '@/views/web/shopdetail.vue';
import Forget  from '@/views/auth/forget.vue';
import ProductRoute from "@views/user/product/route"
import OrderRoute from "@views/user/order/route"

const suburl = import.meta.env.VITE_SUB_URL;

const routes = [
    ...Webroute,
    { path: '/login', component: Login, meta: { guestOnly: true }},
    { path: '/register', component: Register, meta: { guestOnly: true }},
    { path: '/forgetpassowrd',name: 'forgot-password', component: Forget},
    {
        path: "/admin",
        component: Layout,
        children: [
            { path: '', component: Dashboard, },
            { path: 'dashboard', component: Dashboard, },
            ...ProductRoute,
            ...OrderRoute,

        ],
    },
    {
        path: "/:pathMatch(.*)*",
        name: "NotFound",
        component: NotFound
    },
];

const router = createRouter({
    history: createWebHistory(suburl),
    routes,
});



router.beforeEach(async (to, from, next) => {


    const auth = useUserStore()
    const alertStore = useAlertStore()

    //Auth Restriction

        try {

            const res = await auth.getProfile();
            auth.user = res.user;
            auth.is_logged_in = true;
            
        } catch (error) {
            auth.user = {};
            auth.is_logged_in = false;
            localStorage.removeItem('auth_token');
        }
    
    
            // 🔒 Auth-required routes
            if (to.meta.requiresAuth && !auth.is_logged_in) {
                return next('/login')
            }

            // 🚫 Guest-only routes (LOGIN / REGISTER)
            if (to.meta.guestOnly && auth.is_logged_in) {
                return next('/')
            }

            next()



});

export default router;