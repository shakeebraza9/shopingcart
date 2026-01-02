<template>
  <div class="relative">

    <!-- Trigger Button -->
    <button
      @click="open = !open"
      class="flex items-center gap-2 rounded-full p-1 hover:bg-gray-100 transition"
    >
      <div class="h-11 w-11 rounded-full overflow-hidden border">
        <img
          :src="userStore.user.avatar"
          alt="avatar"
          class="h-full w-full object-cover"
        />
      </div>
      <slot />
    </button>

    <!-- Dropdown -->
    <div
      v-if="open"
      @click.outside="open = false"
      class="absolute right-0 mt-3 w-56 bg-white border rounded-xl shadow-lg z-50"
    >
      <!-- Profile Info -->
      <div class="flex items-center gap-3 p-4 border-b">
        <div class="h-10 w-10 rounded-full overflow-hidden border">
          <img
            :src="userStore.user.avatar"
            class="h-full w-full object-cover"
          />
        </div>
        <div>
          <p class="text-sm font-semibold text-gray-900">
            {{ userStore.user.title }}
          </p>
          <p class="text-xs text-gray-500">
            {{ userStore.user.role }}
          </p>
        </div>
      </div>

      <!-- Actions -->
      <div class="p-2">
        <button
          @click="logOut"
          class="flex items-center gap-2 w-full px-3 py-2
                 text-sm text-red-600 rounded-lg
                 hover:bg-red-50 transition"
        >
          <!-- Logout Icon -->
          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
               viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M17 16l4-4m0 0l-4-4m4 4H7"/>
          </svg>

          Logout
        </button>
      </div>
    </div>
  </div>
</template>

<!-- <script>
import { useUserStore } from '@stores/userStore'

export default {
    name: "my-component",
    data() {
        return {
            userStore: useUserStore(),
        };
    },
    methods: {
        logOut() {
            localStorage.removeItem("auth_token");
            this.$alertStore.add("Logged Out Successfully", "success");
            this.$router.push("/login");

        }
    }
};
</script> -->

<script>
import { useUserStore } from '@stores/userStore'

export default {
  name: "ProfileDropdown",
  data() {
    return {
      open: false,
      userStore: useUserStore(),
    }
  },
  methods: {
    logOut() {
      localStorage.removeItem("auth_token")
      this.$alertStore.add("Logged Out Successfully", "success")
      this.$router.push("/login")
      this.open = false
    }
  }
}
</script>

<style scoped >
.profileImage {
    height: 45px;
    width: 45px;
}
</style>
