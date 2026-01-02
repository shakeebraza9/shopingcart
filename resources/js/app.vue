<template>
  <div class="relative min-h-screen">
    <!-- PAGE -->
    <router-view />

    <!-- GLOBAL LOADER -->
    <div
      v-if="themeStore.loading"
      class="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm"
    >
      <div
        class="w-14 h-14 border-4 border-[#C2A875] border-t-transparent rounded-full animate-spin"
      ></div>
    </div>

    <!-- ALERTS -->
    <Alert />
  </div>
</template>

<script>

import { useThemeStore } from './stores/themeStore';
import { useUserStore } from './stores/userStore';
import Alert from '@components/alert.vue'
import Overlay from '@components/overlay.vue'
import { toRaw } from 'vue'




export default {
  props: {},
  components: {
    Alert,
    Overlay
  },
  data() {
    return {
      themeStore: useThemeStore(),
      userStore: useUserStore(),
      
  
    };
  },
  methods: {


  },
  async mounted() {

    
  


  },
};

</script>