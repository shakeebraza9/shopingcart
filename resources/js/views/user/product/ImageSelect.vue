<template>
  <v-select
    :items="images"
    :model-value="selected"
    @update:model-value="onSelect"
    item-title="text"
    item-value="img"
    :label="label"
    placeholder="Select Image"
    dense
  >
    <!-- Selected value -->
    <template #selection="{ item }">
      <div class="d-flex align-center">
        <v-avatar size="36" class="mr-2" v-if="item">
          <img :src="item.img" alt="selected"/>
        </v-avatar>
        <span>{{ item?.text || 'Select Image' }}</span>
      </div>
    </template>

    <!-- Dropdown items -->
    <template #item="{ item, props }">
      <v-list-item v-bind="props">
        <v-list-item-avatar>
          <img :src="item.img" alt="dropdown"/>
        </v-list-item-avatar>
        <v-list-item-title>{{ item.text }}</v-list-item-title>
      </v-list-item>
    </template>
  </v-select>
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
