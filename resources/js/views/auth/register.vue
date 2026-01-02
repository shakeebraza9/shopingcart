<template>
  <div class="min-h-screen flex items-center justify-center bg-[#F8F4EC] px-6">
    <!-- Card -->
    <div class="w-full max-w-md bg-white rounded-3xl shadow-xl px-8 py-10">

      <!-- Brand -->
      <div class="text-center mb-8">
        <h1 class="font-serif text-3xl tracking-widest text-gray-900">
          NOORÉ
        </h1>
        <p class="text-sm text-gray-500 mt-2">
          Create your account
        </p>
      </div>

      <!-- FORM -->
      <form @submit.prevent="onSubmit" class="space-y-5">

        <!-- Name -->
        <div>
          <label class="text-sm text-gray-700">Full Name</label>
          <input
            v-model="form.firstName"
            type="text"
            placeholder="Your name"
            class="input"
          />
          <p v-if="errors.firstName" class="error">
            {{ errors.firstName }}
          </p>
        </div>

        <!-- Email -->
        <div>
          <label class="text-sm text-gray-700">Email</label>
          <input
            v-model="form.personalEmail"
            type="email"
            placeholder="you@example.com"
            class="input"
          />
          <p v-if="errors.personalEmail" class="error">
            {{ errors.personalEmail }}
          </p>
        </div>

        <!-- Password -->
        <div>
          <label class="text-sm text-gray-700">Password</label>
          <input
            v-model="form.password"
            type="password"
            placeholder="••••••••"
            class="input"
          />
          <p v-if="errors.password" class="error">
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
          {{ themeStore.loading ? "Creating account..." : "Create Account" }}
        </button>
      </form>

      <!-- Footer -->
      <p class="text-center text-xs text-gray-500 mt-8">
        Already have an account?
        <router-link to="/login" class="text-[#C2A875] hover:underline ml-1">
          Sign in
        </router-link>
      </p>

    </div>
  </div>
</template>

<script>
import { useThemeStore } from '@/stores/themeStore';
import AuthHeader from './AuthHeader.vue';
import { useUserStore } from '@/stores/userStore';
import { useAlertStore } from '@/stores/alertStore';


export default {
    name: "Register",
    components: { AuthHeader },
    data() {
        return {
            themeStore: useThemeStore(),
            userStore: useUserStore(),
            alertStore: useAlertStore(),
            errors: {},
            form: {
                firstName: "",
                personalEmail:"",
                password: "",
               
            }
                
            };
        //     errors: {source: [
        //         'Google Search',
        //         'Social Media',
        //         'Online Advertisement',
        //         'Friend / Colleague',
        //         'Dealership Partner',
        //         'Trade Event or Expo',
        //         'Vehicle Trader Forum',
        //         'Other'
        //     ],
        //     step: 1,
        //     proofMotorTrade: [],
        //     proofAddress: [],
        //     showMessage: false,
        // };
    },
    // mounted() {

    //     this.$themeStore.startLoading()
    //     this.userStore.getProfile().then(() => {
    //         this.$themeStore.endLoading()
    //         this.$router.replace("/user/dashboard");
    //     }).catch(() => this.$themeStore.endLoading())
        
    // },
    methods: {
        async onSubmit() {            

            this.themeStore.startLoading()
            this.errors = {};

            try {

                console.log(this.form);
                
                let response = await this.userStore.registerRequest(this.form);
                this.userStore.initializeUserSession(response.token,response.user);
                this.themeStore.endLoading();
                this.alertStore.add('Account Created Successfully','success');
                     this.$router.replace("/login");
            } catch (error) {

                this.themeStore.endLoading();
                this.errors = error.validation || {};
                this.alertStore.add(error.message, 'error');

            }


        }

    }
}
</script>

