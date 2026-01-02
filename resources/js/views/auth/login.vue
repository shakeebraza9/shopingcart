<template>
  <div class="min-h-screen flex items-center justify-center bg-[#F8F4EC] px-6">
    <!-- Card -->
    <div
      class="w-full max-w-md bg-white rounded-3xl shadow-xl px-8 py-10"
    >
      <!-- Brand -->
      <div class="text-center mb-8">
        <h1 class="font-serif text-3xl tracking-widest text-gray-900">
          NOORÉ
        </h1>
        <p class="text-sm text-gray-500 mt-2">
          Sign in to your account
        </p>
      </div>

      <!-- FORM -->
      <form @submit.prevent="login" class="space-y-6">
        <!-- Email -->
        <div>
          <label class="block text-sm text-gray-700 mb-1">
            Email address
          </label>
          <input
            v-model="form.email"
            type="email"
            class="w-full rounded-full border border-gray-300 px-5 py-3
                   focus:outline-none focus:ring-2 focus:ring-[#C2A875]"
            placeholder="you@example.com"
          />
          <p v-if="errors.email" class="text-xs text-red-500 mt-1">
            {{ errors.email }}
          </p>
        </div>

        <!-- Password -->
        <div>
          <label class="block text-sm text-gray-700 mb-1">
            Password
          </label>
          <input
            v-model="form.password"
            type="password"
            class="w-full rounded-full border border-gray-300 px-5 py-3
                   focus:outline-none focus:ring-2 focus:ring-[#C2A875]"
            placeholder="••••••••"
          />
          <p v-if="errors.password" class="text-xs text-red-500 mt-1">
            {{ errors.password }}
          </p>
        </div>

        <!-- Button -->
        <button
          type="submit"
          :disabled="themeStore.loading"
          class="w-full py-3 rounded-full
                 bg-[#C2A875] text-white font-medium tracking-wide
                 hover:bg-[#B59A65] transition
                 disabled:opacity-50"
        >
          {{ themeStore.loading ? "Signing in..." : "Sign In" }}
        </button>
      </form>

      <!-- Footer -->
      <p class="text-center text-xs text-gray-500 mt-8 leading-relaxed">
        Securely sign in to your account using your email and password.
      </p>
    </div>
  </div>
</template>

<script>
import { useThemeStore } from "@stores/themeStore";
import { useUserStore } from "@stores/userStore";
import { useAlertStore } from "@stores/alertStore";
import Logo from "@assets/images/logo/logo.png";
import AuthHeader from "./AuthHeader.vue";
import { toRaw } from "vue";


export default {
    name: "Login",
    components: {
        AuthHeader
    },
    data() {
        return {
            logo: Logo,
            themeStore: useThemeStore(),
            userStore: useUserStore(),
            alertStore: useAlertStore(),
            errors: {},
            loading: false,
            form: {
                email: "man411210@gmail.com",
                password: "12345678",
            },
        };
    },
    computed: {

    },
    // mounted() {

    //     // console.log(toRaw(this.userStore.$state));
    //     this.$themeStore.startLoading()
    //     this.userStore.getProfile().then(() => {
    //         this.$themeStore.endLoading()
    //         // this.$router.replace("/admin/dashboard");
    //         this.$router.replace("/");

    //     }).catch(() => this.$themeStore.endLoading())
            
       
    // },
    methods: {
        // async login() {
        //     const themeStore = useThemeStore();

        //     themeStore.startLoading();
        //     this.errors = {};

        //     try {

        //         let response = await this.userStore.loginRequest(this.form);
        //         this.userStore.initializeUserSession(response.token,response.user);
        //         themeStore.endLoading();
        //         this.alertStore.add('Logged In Success', 'success');
        //         this.$router.replace("/admin/dashboard");

        //     } catch (error) {
        //         themeStore.endLoading();
        //         this.errors = error.validation || {};
        //         this.alertStore.add(error.message, 'error');
        //     }
        // },
        async login() {
          this.themeStore.startLoading()
          this.errors = {}

          try {
            const response = await this.userStore.loginRequest(this.form)

            // If user not found in DB, backend should return error, but double check:
            if (!response.user || !response.token) {
              this.alertStore.add('User not found in database.', 'error')
              this.themeStore.endLoading()
              return
            }

            // save session
            await this.userStore.initializeUserSession(
              response.token,
              response.user
            )

            this.alertStore.add("Logged in successfully", "success")
            await this.$nextTick()
            this.$router.replace("/")
          } catch (error) {
            this.errors = error.validation || {}
            this.alertStore.add(error.message, "error")
          } finally {
            this.themeStore.endLoading()
          }
        },
        goToForgotPassword() {
            console.log('Forgot clicked')
            this.$router.push({ name: 'forgot-password' })
        }
    }

};
</script>
<style scoped></style>
