<template>
  <div class="relative inline-block">
    <!-- Button -->
    <button
      @click="open = !open"
      class="p-2 rounded-md hover:bg-gray-200 dark:hover:bg-gray-700"
    >
      <i
        class="mdi text-lg"
      ></i>
    </button>

    <!-- Dropdown -->
    <div
      v-if="open"
      class="absolute right-0 mt-2 w-44 rounded-md border bg-white shadow-md dark:bg-gray-800"
      style="margin-left: -100px"
    >
      <!-- Light Theme -->
      <!-- <button
        @click="toggleTheme"
        class="flex w-full items-center gap-3 px-4 py-2 text-sm hover:bg-gray-100 dark:hover:bg-gray-700"
      >
        <i
          class="mdi mdi-lightbulb-on"
          :class="isLight ? 'text-blue-500' : 'text-gray-400'"
        ></i>
        <span>Light Theme</span>
      </button> -->

      <!-- Dark Theme -->
      <!-- <button
        @click="toggleTheme"
        class="flex w-full items-center gap-3 px-4 py-2 text-sm hover:bg-gray-100 dark:hover:bg-gray-700"
      >
        <i
          class="mdi mdi-lightbulb-off"
        ></i>
        <span>Dark Theme</span>
      </button> -->
    </div>
  </div>
</template>

<script>
// import { useTheme } from "vuetify";

export default {
  name: "IconMenu",
  data() {
    return {
      vuetify: useTheme(),
      open: false,
    };
  },
//   computed: {
//     isDark() {
//       return this.vuetify.global.name === "adminDark";
//     },
//     isLight() {
//       return this.vuetify.global.name === "adminLight";
//     },
//   },
//   methods: {
//     toggleTheme() {
//       this.vuetify.change(this.isDark ? "adminLight" : "adminDark");
//       this.open = false;
//     },
//   },
};
</script>
