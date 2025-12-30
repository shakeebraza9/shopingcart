<template>
  <v-container class="py-8">
    <v-card class="mx-auto" elevation="5">
      <v-card-title class="text-h5 font-weight-bold">
        {{ isEdit ? 'Edit Product' : 'Create Product' }}
      </v-card-title>
      <v-card-text>
        <v-form ref="productForm" class="pa-4">

          <v-row dense>
            <v-col cols="12" md="6">
              <v-text-field v-model="product.title" label="Product Title" outlined dense required />
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="product.slug" label="Slug" outlined dense required />
            </v-col>
          </v-row>


          <v-row>
            <v-col cols="12" md="6">
              <CategorySelect v-model="product.category" />
            </v-col>
          </v-row>

            <v-row>
            <v-col cols="12" md="6">
                <ImageSelect v-model="product.thumbnail" :images="images" label="Thumbnail" />
            </v-col>
            <v-col cols="12" md="6">
                <ImageSelect v-model="product.hoverImage" :images="images" label="Hover Image" />
            </v-col>
            </v-row>


          <!-- Prices -->
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field
                v-model="product.price"
                type="number"
                label="Price"
                outlined
                dense
              />
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field
                v-model="product.sellingPrice"
                type="number"
                label="Selling Price"
                outlined
                dense
              />
            </v-col>
          </v-row>

          <!-- Description -->
          <v-row>
            <v-col cols="12">
              <v-textarea
                v-model="product.description"
                label="Description"
                rows="2"
                outlined
                dense
              />
            </v-col>
          </v-row>

          <!-- Save Button -->
           <div mt="3">

               <v-row justify="center">
                   <v-col cols="12" md="3">
                       <v-btn color="primary" block @click="submitForm">
                           {{ isEdit ? 'Update Product' : 'Save Product' }}
                        </v-btn>
                    </v-col>
                </v-row>
            </div>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
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
