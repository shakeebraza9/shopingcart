<template>
  <div class="py-8">
    <div class="mx-auto max-w-5xl rounded-lg bg-white shadow-lg dark:bg-gray-900">
      <!-- Card Title -->
      <div class="border-b px-6 py-4">
        <h2 class="text-xl font-bold text-gray-800 dark:text-gray-100">
          {{ isEdit ? 'Edit Product' : 'Create Product' }}
        </h2>
      </div>

      <!-- Card Body -->
      <div class="p-6">
        <form class="space-y-6">
          <!-- Title & Slug -->
          <div class="grid grid-cols-1 gap-4 md:grid-cols-2">
            <div>
              <label class="form-label">Product Title</label>
              <input
                v-model="product.title"
                type="text"
                required
                class="form-input"
              />
            </div>

            <div>
              <label class="form-label">Slug</label>
              <input
                v-model="product.slug"
                type="text"
                required
                class="form-input"
              />
            </div>
          </div>

          <!-- Category -->
          <div class="grid grid-cols-1 md:grid-cols-2">
            <CategorySelect v-model="product.category" />
          </div>

          <!-- Images -->
          <div class="grid grid-cols-1 gap-4 md:grid-cols-2">
            <ImageSelect
              v-model="product.thumbnail"
              :images="images"
              label="Thumbnail"
            />
            <ImageSelect
              v-model="product.hoverImage"
              :images="images"
              label="Hover Image"
            />
          </div>

          <!-- Prices -->
          <div class="grid grid-cols-1 gap-4 md:grid-cols-2">
            <div>
              <label class="form-label">Price</label>
              <input
                v-model="product.price"
                type="number"
                class="form-input"
              />
            </div>

            <div>
              <label class="form-label">Selling Price</label>
              <input
                v-model="product.sellingPrice"
                type="number"
                class="form-input"
              />
            </div>
          </div>

          <!-- Description -->
          <div>
            <label class="form-label">Description</label>
            <textarea
              v-model="product.description"
              rows="2"
              class="form-input"
            ></textarea>
          </div>

          <!-- Save Button -->
          <div class="flex justify-center pt-4">
            <button
              type="button"
              @click="submitForm"
              class="w-full max-w-xs rounded-md bg-blue-600 px-6 py-2 text-white hover:bg-blue-700"
            >
              {{ isEdit ? 'Update Product' : 'Save Product' }}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>


<script setup>
import { reactive, ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import generaApi from '@/models/general.model'
import ImageSelect from './ImageSelect.vue'
import CategorySelect from './CategorySelect.vue'

const route = useRoute()
const productId = route.params.id || null
const isEdit = !!productId

const product = reactive({
  title: '',
  slug: '',
  category: null,
  thumbnail: null,
  hoverImage: null,
  price: 0,
  sellingPrice: 0,
  description: ''
})

const images = ref([])

const fetchImages = async () => {
  try {
    const response = await generaApi.get('api/getfiles')
    images.value = response.results.map(img => ({
      id: img.id,
      text: img.text,
      img: img.img
    }))
  } catch (err) {
    console.error(err)
  }
}

const fetchProduct = async (id) => {
  try {
    const response = await generaApi.get(`api/products/${id}`)
    if(response.status){
      const data = response.data
      product.title = data.title
      product.slug = data.slug
      product.category = data.category // Make sure CategorySelect can match this
      product.price = data.price
      product.sellingPrice = data.selling_price
      product.description = data.description
      product.thumbnail = data.image
      product.hoverImage = data.hover_image
    }
  } catch (err) {
    console.error(err)
  }
}

const submitForm = async () => {
  try {

    const payload = {
      title: product.title,
      slug: product.slug,
      details: '', 
      description: product.description,
      category_id: product.category, 
      selling_price: product.sellingPrice,
      image: product.thumbnail,
      hover_image: product.hoverImage
    }

    let response
    if (isEdit) {

      response = await generaApi.put(`api/products/${productId}`, payload)
    } else {

      response = await generaApi.post('api/products', payload)
    }

    if (response.status) {
      alert(isEdit ? 'Product updated successfully!' : 'Product created successfully!')

    } else {
      alert('Something went wrong: ' + response.message)
    }
  } catch (err) {
    console.error(err)
    alert('Error submitting form: ' + err.message)
  }
}



onMounted(() => {
  fetchImages()
  if(isEdit) fetchProduct(productId)
})
</script>
