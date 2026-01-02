<template>
  <!-- Mobile Overlay -->
  <div
    v-if="themeStore.menuOpen"
    class="fixed inset-0 z-40 bg-black/40 lg:hidden"
    @click="themeStore.menuOpen = false"
  ></div>

  <!-- Sidebar -->
  <aside
    class="fixed top-0 left-0 z-50 h-screen bg-[#0f172a] text-white
           transition-all duration-300 ease-in-out flex flex-col"
    :class="[
      themeStore.menuOpen
        ? 'translate-x-0'
        : '-translate-x-full lg:translate-x-0',
      isExpanded ? 'w-[258px]' : 'w-[68px]'
    ]"
    @mouseenter="expandMenu"
    @mouseleave="collapseMenu"
  >
    <!-- Logo -->
    <div class="flex h-[70px] items-center justify-center border-b border-white/10">
      <span class="text-lg font-semibold">
        {{ isExpanded ? 'Admin' : 'A' }}
      </span>
    </div>

    <!-- Menu -->
    <nav class="flex-1 overflow-y-auto py-3">
      <template v-for="(item, index) in menus" :key="index">
        <!-- Group -->
        <div v-if="item.children" class="mb-1">
          <button
            @click="toggleGroup(item.label)"
            class="flex w-full items-center gap-3 px-4 py-2 text-left
                   transition hover:bg-white/10"
          >
            <span class="flex-1 truncate text-sm">
              {{ item.label }}
            </span>
            <span class="text-xs">
              {{ openGroup === item.label ? '−' : '+' }}
            </span>
          </button>

          <div
            v-if="openGroup === item.label"
            class="ml-4 mt-1 space-y-1"
          >
            <router-link
              v-for="child in item.children"
              :key="child.path"
              :to="child.path"
              class="block rounded px-3 py-2 text-sm transition
                     hover:bg-white/10"
              active-class="bg-[#C2A875] font-medium text-black"
            >
              {{ child.label }}
            </router-link>
          </div>
        </div>

        <!-- Single -->
        <router-link
          v-else
          :to="item.path"
          class="flex items-center gap-3 rounded px-4 py-2
                 transition hover:bg-white/10"
          active-class="bg-[#C2A875] font-medium text-black"
        >
          <span class="truncate text-sm">
            {{ item.label }}
          </span>
        </router-link>
      </template>
    </nav>
  </aside>
</template>

<script>
import { useThemeStore } from "@stores/themeStore";
import Menus from "./menu";

export default {
  setup() {
    const themeStore = useThemeStore();
    return { themeStore };
  },
  data() {
    return {
      menus: Menus,
      openGroup: null,
    };
  },
  computed: {
    isExpanded() {
      return this.themeStore.menuType === "expanded";
    },
  },
  methods: {
    expandMenu() {
      this.themeStore.menuType = "expanded";
    },
    collapseMenu() {
      this.themeStore.menuType = "collapsed";
    },
    toggleGroup(label) {
      this.openGroup = this.openGroup === label ? null : label;
    },
  },
};
</script>
