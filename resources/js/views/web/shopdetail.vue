<template>
  <v-container class="py-16">
    
    <v-btn text color="primary" class="mb-6" @click="$router.back()">
      <v-icon left>mdi-arrow-left</v-icon> Back to Shop
    </v-btn>

    <v-row v-if="product" dense>
      <v-col cols="12" md="6">
        <v-img
          :src="imageUrl(product.image)"
          height="400"
          contain
        />
      </v-col>


      <v-col cols="12" md="6">
        <h2 class="text-h4 font-weight-bold mb-2">{{ product.title }}</h2>

        <div class="mb-4">
          <v-chip
            v-if="product.is_featured"
            color="primary"
            size="small"
            class="ma-1"
            label
          >
            Featured
          </v-chip>
          <v-chip
            v-if="product.selling_price < product.price"
            color="red"
            size="small"
            class="ma-1"
            label
          >
            Sale
          </v-chip>
        </div>

        <div class="mb-3">
          <span class="text-h5 text-primary font-weight-bold">
            Rs. {{ Number(product.selling_price).toLocaleString() }}
          </span>
          <span
            v-if="product.selling_price < product.price"
            class="text-caption text-decoration-line-through ml-2"
          >
            Rs. {{ Number(product.price).toLocaleString() }}
          </span>
        </div>

        <p class="mb-4">{{ product.details || product.description || 'No description available.' }}</p>

        <v-btn color="primary" rounded="lg" block>
          Buy Now
        </v-btn>
      </v-col>
    </v-row>


    <div v-if="loading" class="text-center py-16">
      <v-progress-circular indeterminate color="primary" />
    </div>


    <div v-if="!product && !loading" class="text-center py-16">
      <h3>Product not found</h3>
    </div>

  </v-container>
</template>

<script>
import generaApi from "@/models/general.model"

export default {
  data() {
    return {
      product: null,
      loading: false,
      slug: this.$route.params.slug || "",
    }
  },

  mounted() {
    if (this.slug) this.fetchProduct()
  },

  methods: {
    fetchProduct() {
      this.loading = true
      generaApi
        .getAndfind(`/api/shop/${this.slug}`)
        .then(res => {
          if (res.data && res.status) {
            this.product = res.data
          } else {
            console.error("Product not found")
            this.product = null
          }
        })
        .catch(err => {
          console.error("Product API error:", err)
        })
        .finally(() => {
          this.loading = false
        })
    },

    imageUrl(img) {
      if (!img) return 'https://localhost/shopingcart/placeholder.png'
      if (img.startsWith('http')) return img
      return `https://localhost/shopingcart/public/${img}`
    }
  }
}
</script>
