
<template>
  <transition name="fade">
    <div
      v-if="alert.show && alert.current"
      class="fixed top-6 right-6 z-50 min-w-[250px] max-w-sm shadow-lg rounded-lg px-4 py-3 flex items-center justify-between"
      :style="{ background: alert.current.color }"
      role="alert"
    >
      <span class="font-medium text-white">{{ alert.current.message }}</span>
      <button
        @click="alert.show = false"
        class="ml-4 text-white hover:text-gray-200 focus:outline-none"
        aria-label="Close"
      >
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </div>
  </transition>
</template>

<script setup>
import { useAlertStore } from '@/stores/alertStore'
const alert = useAlertStore()
</script>
