<template>
  <div
    class="fixed inset-0 z-[9999] flex items-center justify-center
           bg-white/60 backdrop-blur-md"
  >
    <div
      class="bg-white/80 backdrop-blur-xl
             rounded-2xl px-14 py-12
             shadow-2xl flex flex-col items-center"
    >
      <!-- SPINNER -->
      <div
        class="w-14 h-14 border-4 border-[#C2A875]
               border-t-transparent rounded-full animate-spin"
      ></div>

      <!-- TEXT -->
      <p class="mt-6 text-sm font-medium text-gray-700 tracking-wide">
        Please wait...
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: "Overlay"
}
</script>
