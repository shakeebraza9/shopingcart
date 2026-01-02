
<template>
    <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 via-white to-blue-100 relative">
        <div class="absolute bottom-0 left-0 right-0 h-40 bg-blue-200" style="clip-path: polygon(0 29%, 100% 0, 100% 100%, 0% 100%);"></div>
        <div class="w-full max-w-md bg-white rounded-lg shadow-lg p-8 z-10 relative">
            <h2 class="text-2xl font-bold text-center mb-2 text-gray-800">Forgot Password</h2>
            <p class="text-center text-gray-500 mb-6">Enter your email to receive a password reset link</p>

            <form @submit.prevent="sendResetLink">
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                    <div class="relative">
                        <span class="absolute left-3 top-2 text-gray-400">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12H8m8 0a4 4 0 11-8 0 4 4 0 018 0zm0 0v4m0-4V8" />
                            </svg>
                        </span>
                        <input
                            id="email"
                            v-model="form.email"
                            type="email"
                            class="pl-10 pr-4 py-2 w-full border rounded focus:outline-none focus:ring-2 focus:ring-blue-400"
                            :class="{ 'border-red-500': errors.email }"
                            placeholder="Email Address"
                            autocomplete="email"
                            required
                        />
                    </div>
                    <p v-if="errors.email" class="text-xs text-red-500 mt-1">{{ errors.email }}</p>
                </div>

                <button
                    type="submit"
                    class="w-full py-2 px-4 bg-blue-600 text-white font-semibold rounded hover:bg-blue-700 transition disabled:opacity-50"
                    :disabled="loading"
                >
                    <span v-if="loading">Sending...</span>
                    <span v-else>Send Reset Link</span>
                </button>
            </form>

            <hr class="my-6" />

            <div class="text-center">
                <button
                    type="button"
                    class="text-blue-600 hover:underline text-sm font-medium"
                    @click="$router.push('/login')"
                >
                    Back to Login
                </button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { useAlertStore } from '@stores/alertStore';
import axios from 'axios';

const alertStore = useAlertStore();
const loading = ref(false);
const errors = ref({});
const form = ref({ email: '' });

async function sendResetLink() {
    errors.value = {};
    loading.value = true;
    try {
        // Replace with your actual API endpoint
        const response = await axios.post('/api/auth/forgot-password', { email: form.value.email });
        alertStore.add('Password reset link sent to your email.', 'success');
        form.value.email = '';
    } catch (error) {
        if (error.response && error.response.data && error.response.data.errors) {
            errors.value = error.response.data.errors;
        } else {
            alertStore.add('Failed to send reset link.', 'error');
        }
    } finally {
        loading.value = false;
    }
}
</script>

<style scoped>
</style>
