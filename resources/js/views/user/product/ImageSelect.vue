<template>
  <div class="relative w-full">

    <!-- Label -->
    <label v-if="label" class="block text-sm font-medium text-gray-700 mb-1">
      {{ label }}
    </label>

    <!-- Selected Box -->
    <button
      type="button"
      @click="open = !open"
      class="w-full flex items-center justify-between
             rounded-lg border bg-white px-3 py-2
             text-sm text-gray-700
             hover:border-[#C2A875]
             focus:outline-none focus:ring-2 focus:ring-[#C2A875]"
    >
      <div class="flex items-center gap-2">
        <img
          v-if="selected"
          :src="selected.img"
          class="h-9 w-9 rounded border object-cover"
        />
        <span class="text-gray-600">
          {{ selected?.text || 'Select Image' }}
        </span>
      </div>

      <svg class="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
      </svg>
    </button>

    <!-- Dropdown -->
    <div
      v-if="open"
      class="absolute z-50 mt-1 w-full rounded-lg border bg-white shadow-lg"
    >
      <ul class="max-h-60 overflow-auto py-1">
        <li
          v-for="item in images"
          :key="item.img"
          @click="onSelect(item)"
          class="flex items-center gap-3 px-3 py-2
                 cursor-pointer hover:bg-gray-50"
        >
          <img
            :src="item.img"
            class="h-9 w-9 rounded border object-cover"
          />
          <span class="text-sm text-gray-700">
            {{ item.text }}
          </span>
        </li>

        <li
          v-if="!images.length"
          class="px-4 py-3 text-sm text-gray-500 text-center"
        >
          No images available
        </li>
      </ul>
    </div>

  </div>
</template>


<script setup>
import { ref, watch, onMounted } from 'vue'
import { defineProps, defineEmits } from 'vue'

const props = defineProps({
  modelValue: { type: Object, default: null },
  images: { type: Array, required: true },
  label: { type: String, default: 'Select Image' }
})

const emit = defineEmits(['update:modelValue'])

const selected = ref(null)


watch(() => props.modelValue, val => {
  if (val) {

    const match = props.images.find(img => img.img === val.img) || val
    selected.value = match
  } else {
    selected.value = null
  }
})


const onSelect = (val) => {
  selected.value = val
  emit('update:modelValue', val)
}


onMounted(() => {
  if (!selected.value && props.images.length > 0 && props.modelValue) {
    const match = props.images.find(img => img.img === props.modelValue.img)
    if (match) selected.value = match
  }
})
</script>
