<template>
  <div
    class="relative w-full rounded-2xl overflow-hidden
           bg-white/80 backdrop-blur
           shadow-[0_10px_30px_rgba(0,0,0,0.08)]
           hover:shadow-[0_14px_40px_rgba(0,0,0,0.12)]
           transition-all duration-300"
  >
    <!-- Accent strip -->
    <div class="absolute top-0 left-0 h-1 w-full bg-gradient-to-r from-[#E6D3A3] via-[#C2A875] to-[#B89B5E]" />

    <div class="px-6 py-6">
      <!-- Count -->
      <div class="flex items-center justify-between">
        <span class="text-4xl font-serif font-semibold text-gray-900 tracking-tight">
          {{ count }}
        </span>

        <!-- Decorative dot -->
        <span class="h-3 w-3 rounded-full bg-[#C2A875]/70"></span>
      </div>

      <!-- Title -->
      <p class="mt-3 text-sm uppercase tracking-widest text-gray-500">
        {{ title }}
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DashboardCard',
  props: {
    title: {
      type: String,
      required: true
    },
    count: {
      type: Number,
      required: true
    }
  }
}
</script>
