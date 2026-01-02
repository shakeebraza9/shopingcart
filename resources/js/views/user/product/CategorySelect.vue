<template>
  <div class="w-full">
    <label class="mb-1 block text-sm font-medium text-gray-700 dark:text-gray-300">
      Category
    </label>

    <select
      v-model="selectedCategory"
      required
      class="w-full rounded-md border border-gray-300 bg-white px-3 py-2 text-sm
             focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500
             dark:border-gray-700 dark:bg-gray-800 dark:text-white"
    >
      <option disabled value="">
        Loading categories...
      </option>

      <option
        v-for="category in categories"
        :key="category.id"
        :value="category.id"
      >
        {{ category.title }}
      </option>
    </select>
  </div>
</template>


<script setup>
import { ref, onMounted, watch } from 'vue'
import generaApi from '@/models/general.model'

const props = defineProps({
  modelValue: [Number, String]
})

const emit = defineEmits(['update:modelValue'])

const selectedCategory = ref(props.modelValue)
const categories = ref([])

const fetchCategories = async () => {
  try {
    const response = await generaApi.get('api/categories')
    if (response.success) {
      categories.value = response.data
    }
  } catch (err) {
    console.error(err)
  }
}

watch(selectedCategory, val => {
  emit('update:modelValue', val)
})


watch(() => props.modelValue, val => {
  selectedCategory.value = val
})

onMounted(fetchCategories)
</script>
