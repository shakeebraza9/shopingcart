<template>
  <div class="min-h-screen bg-[#F8F4EC] py-16 px-6">

    <!-- BACK -->
    <button
      @click="$router.back()"
      class="mb-10 flex items-center gap-2 text-sm text-gray-600 hover:text-gray-900 transition"
    >
      ← Back to Shop
    </button>

    <!-- LOADER -->
    <div v-if="loading" class="flex justify-center py-24">
      <div class="w-12 h-12 border-4 border-[#C2A875] border-t-transparent rounded-full animate-spin"></div>
    </div>

    <!-- PRODUCT -->
    <div
      v-else-if="product"
      class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-16"
    >

      <!-- IMAGE -->
      <div class="bg-white rounded-3xl p-10 shadow-sm">
        <img
          :src="imageUrl(product.image)"
          :alt="product.title"
          class="w-full h-[420px] object-contain"
        />
      </div>

      <!-- INFO -->
      <div class="flex flex-col justify-center">
        <p class="uppercase tracking-widest text-xs text-gray-500 mb-2">
          Signature Line
        </p>

        <h1 class="text-4xl font-serif font-semibold mb-4 text-gray-900">
          {{ product.title }}
        </h1>

        <p class="text-gray-600 leading-relaxed mb-6">
          {{ product.description || 'A premium fragrance crafted for elegance and presence.' }}
        </p>

        <!-- PRICE -->
        <div class="flex items-center gap-4 mb-6">
          <span class="text-2xl font-semibold text-[#C2A875]">
            Rs. {{ formatPrice(product.selling_price) }}
          </span>

          <span
            v-if="product.selling_price < product.price"
            class="text-sm text-gray-400 line-through"
          >
            Rs. {{ formatPrice(product.price) }}
          </span>
        </div>

        <!-- STOCK -->
        <p class="text-sm mb-6">
          <span :class="product.stock_quantity > 0 ? 'text-green-600' : 'text-red-600'">
            {{ product.stock_quantity > 0 ? 'In Stock' : 'Out of Stock' }}
          </span>
          · {{ product.stock_quantity }} units available
        </p>

        <!-- QUANTITY -->
        <div class="flex items-center gap-6 mb-8">
          <div class="flex items-center border rounded-full overflow-hidden">
            <button
              class="px-4 py-2 text-lg disabled:opacity-30"
              @click="decreaseQty"
              :disabled="quantity <= 1"
            >−</button>

            <span class="px-6">{{ quantity }}</span>

            <button
              class="px-4 py-2 text-lg disabled:opacity-30"
              @click="increaseQty"
              :disabled="quantity >= product.stock_quantity"
            >+</button>
          </div>
        </div>

        <!-- ADD TO CART -->
        <button
          :disabled="addDisabled"
          @click="addToCart"
          class="w-full md:w-auto px-10 py-4 rounded-full
                 bg-[#C2A875] text-white font-medium
                 hover:bg-[#B59A65] transition disabled:opacity-40"
        >
          {{ cart?.isInCart(product.id) ? 'Added ✓' : 'Add to Cart' }}
        </button>
      </div>
    </div>

    <!-- SUGGESTED -->
    <div v-if="suggested.length" class="max-w-7xl mx-auto mt-24">
      <h2 class="text-2xl font-serif font-semibold mb-10">
        You may also like
      </h2>

      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
        <div
          v-for="item in suggested"
          :key="item.id"
          class="bg-white rounded-2xl p-6 shadow-sm hover:shadow-md transition"
        >
          <img
            :src="imageUrl(item.image)"
            class="w-full h-40 object-contain mb-4"
          />

          <h3 class="text-sm font-semibold mb-2">
            {{ item.title }}
          </h3>

          <p class="text-sm text-[#C2A875] font-medium mb-4">
            Rs. {{ formatPrice(item.selling_price) }}
          </p>

          <button
            @click="$router.push(`/shop/${item.slug}`)"
            class="text-sm text-gray-700 hover:text-black"
          >
            View Product →
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import generaApi from "@/models/general.model"
import { useCartStore } from "@/stores/cartStore"

export default {
  data() {
    return {
      product: null,
      suggested: [],
      quantity: 1,
      loading: false,
      cart: null,
    }
  },

  computed: {
    addDisabled() {
      return (
        !this.cart ||
        this.product.stock_quantity === 0 ||
        this.quantity > this.product.stock_quantity ||
        this.cart.isInCart(this.product.id)
      )
    }
  },

  watch: {
    "$route.params.slug": {
      immediate: true,
      handler(slug) {
        if (slug) this.fetchProduct(slug)
      }
    }
  },

  mounted() {
    this.cart = useCartStore()
    this.cart.load()
  },

  methods: {
    fetchProduct(slug) {
      this.loading = true
      this.quantity = 1

      generaApi.getAndfind(`/api/shop/${slug}`)
        .then(res => {
          this.product = res?.data || null
          if (this.product) this.fetchSuggested()
        })
        .finally(() => {
          this.loading = false
        })
    },

    fetchSuggested() {
      generaApi
        .getAndfind(`/api/shop?related_to=${this.product.id}`)
        .then(res => {
          this.suggested = res?.data?.data || []
        })
    },

    increaseQty() {
      if (this.quantity < this.product.stock_quantity) this.quantity++
    },

    decreaseQty() {
      if (this.quantity > 1) this.quantity--
    },
  addToCart() {
    if (!this.product || this.product.stock_quantity === 0) return

    this.cart.addToCart({
      id: this.product.id,
      title: this.product.title,
      price: this.product.selling_price,
      quantity: this.quantity,
      stock: this.product.stock_quantity,
      image: this.product.image,
      slug: this.product.slug
    })

    // OPEN sidebar immediately
    this.$root.cartDrawer = true // if CartDrawer is a root-level ref
  },

    formatPrice(val) {
      return Number(val || 0).toLocaleString()
    },

    imageUrl(img) {
      if (!img) return 'https://localhost/shopingcart/placeholder.png'
      if (img.startsWith('http')) return img
      return `https://localhost/shopingcart/public/${img}`
    }
  }
}
</script>
