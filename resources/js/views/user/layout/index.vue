<template>
  <div class="min-h-screen flex bg-gray-100">

    <!-- Sidebar -->
    <Sidebar />

    <!-- Main Wrapper -->
<div
  class="flex-1 flex flex-col transition-all duration-300"
  :class="[
    themeStore.menuType === 'expanded'
      ? 'lg:ml-[258px]'
      : 'lg:ml-[68px]'
  ]"
>

      <!-- TOP BAR -->
      <header
        class="h-[70px] bg-white border-b shadow flex items-center justify-between px-4"
      >
        <!-- Left -->
        <div class="flex items-center gap-3">
          <!-- Mobile Menu Button -->
          <button
            class="lg:hidden p-2 rounded border"
            @click="themeStore.toggleMenu()"
          >
            ☰
          </button>

          <!-- Desktop Menu Toggle -->
          <div
            class="hidden lg:flex w-[30px] h-[30px] rounded-full border items-center justify-center cursor-pointer"
            @click="toggleMenu"
          >
            <span class="text-sm">
              {{ isMenuOpen ? '←' : '→' }}
            </span>
          </div>

          <!-- Title -->
          <h1 class="hidden sm:block text-lg font-medium pl-2">
            Dashboard
          </h1>
        </div>

        <!-- Right -->
        <div class="flex items-center gap-3">

          <!-- Fullscreen -->
          <button
            class="p-2 rounded border hover:bg-gray-50"
            @click="toggleFullScreen"
          >
            ⛶
          </button>

          <!-- Profile -->
          <ProfileDropdown />
        </div>
      </header>

      <!-- MAIN CONTENT -->
      <main class="flex-1 bg-gray-50 p-4">
        <router-view />
      </main>

    </div>
  </div>
</template>

<script>
import Sidebar from "./Sidebar/index.vue";
import ProfileDropdown from "./ProfileDropdown.vue";
import Notificationdropdown from "./Notificationdropdown.vue";
import ThemeDropdown from "./ThemeDropdown.vue";

import { useThemeStore } from "@stores/themeStore";

export default {
  name: "AdminLayout",

  components: {
    Sidebar,
    ProfileDropdown,
    Notificationdropdown,
    ThemeDropdown,
  },

  data() {
    return {
      themeStore: useThemeStore(),
      isMenuOpen: false,
      isFullScreen: false,
    };
  },

  methods: {
    toggleFullScreen() {
      if (!this.isFullScreen) {
        const el = document.documentElement;
        el.requestFullscreen?.() ||
          el.webkitRequestFullscreen?.() ||
          el.mozRequestFullScreen?.() ||
          el.msRequestFullscreen?.();
      } else {
        document.exitFullscreen?.() ||
          document.webkitExitFullscreen?.() ||
          document.mozCancelFullScreen?.() ||
          document.msExitFullscreen?.();
      }

      this.isFullScreen = !this.isFullScreen;
    },

    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
      this.themeStore.toggleMenuType();
    },
  },
};
</script>

<style scoped>
/* kept empty intentionally */
</style>
