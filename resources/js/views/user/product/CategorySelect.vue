<template>
  <v-select
    v-model="selectedCategory"
    :items="categories"
    label="Category"
    item-text="title"
    item-value="id"
    outlined
    dense
    required
  >
    <template #no-data>
      <v-list-item>
        <v-list-item-title>Loading categories...</v-list-item-title>
      </v-list-item>
    </template>
  </v-select>
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
