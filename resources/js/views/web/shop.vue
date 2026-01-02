<template>
  <div class="min-h-screen bg-linear-to-br from-[#FAF7F2] via-[#F3EEE7] to-white">

    <!-- ================= HERO ================= -->
    <section class="max-w-7xl mx-auto px-6 py-24 text-center">
      <h1 class="text-5xl md:text-6xl font-serif font-semibold text-[#1C1C1C]">
        Our Collection
      </h1>
      <p class="mt-6 max-w-2xl mx-auto text-gray-600">
        Discover premium fragrances crafted with elegance, depth and timeless character.
      </p>
    </section>

    <!-- ================= AROMATIC ================= -->
    <section class="max-w-7xl mx-auto px-6 py-16 grid md:grid-cols-2 gap-10 items-center">
      <div class="bg-linear-to-br from-[#1C1C1C] to-[#2A2A2A] rounded-3xl p-10 text-white">
        <p class="text-sm tracking-widest opacity-80">SIGNATURE LINE</p>
        <h2 class="text-4xl font-serif font-bold mt-2 mb-4">Aromatic Fragrance</h2>
        <p class="text-sm opacity-80 leading-relaxed mb-8">
          Deep notes blended for confidence, power and presence.
        </p>
        <a href="#" class="inline-flex items-center gap-2 text-sm font-medium text-[#C9A24D]">
          View Collection →
        </a>
      </div>

      <div class="grid grid-cols-2 gap-6">
        <div
          v-for="item in heroAromaticProducts"
          :key="item.id"
          class="group bg-white/70 backdrop-blur rounded-2xl p-4 shadow hover:shadow-xl transition"
        >
          <img
            :src="imageUrl(item.image)"
            class="w-full h-44 object-cover rounded-xl mb-3 group-hover:scale-105 transition"
          />
          <h3 class="text-sm font-medium text-[#1C1C1C] line-clamp-1">
            {{ item.title }}
          </h3>
          <p class="text-sm text-[#C9A24D] font-semibold">
            Rs. {{ Number(item.selling_price).toLocaleString() }}
          </p>
        </div>
      </div>
    </section>

    <!-- ================= PRODUCT GRID ================= -->
    <section class="max-w-7xl mx-auto px-6 py-24">
      <div class="grid sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-10">

        <div
          v-for="item in filteredProducts"
          :key="item.id"
          class="group bg-white rounded-3xl p-5 shadow-sm hover:shadow-2xl transition"
        >
          <div class="overflow-hidden rounded-2xl bg-[#F7F4EF]">
            <img
              :src="imageUrl(item.image)"
              class="w-full h-64 object-cover group-hover:scale-105 transition duration-500"
            />
          </div>

          <h3 class="mt-4 text-base font-medium text-[#1C1C1C] line-clamp-1">
            {{ item.title }}
          </h3>

          <div class="flex items-center gap-2 mt-2">
            <span class="text-lg font-semibold text-[#C9A24D]">
              Rs. {{ Number(item.selling_price).toLocaleString() }}
            </span>
            <span
              v-if="item.selling_price < item.price"
              class="text-sm text-gray-400 line-through"
            >
              Rs. {{ Number(item.price).toLocaleString() }}
            </span>
          </div>

          <a
            :href="`/shop/${item.slug || item.id}`"
            class="mt-5 block text-center py-2.5 rounded-full border border-[#C9A24D] text-[#C9A24D]
                   hover:bg-[#C9A24D] hover:text-white transition text-sm"
          >
            View Product
          </a>
        </div>

      </div>

      <!-- Loader -->
      <div v-if="loading" class="text-center py-24">
        <div class="inline-block h-10 w-10 animate-spin rounded-full border-4 border-[#C9A24D] border-t-transparent"></div>
      </div>
    </section>
  </div>
</template>

<script>
import generaApi from "@/models/general.model"
import { useCartStore } from "@/stores/cartStore"
import { useSearchStore } from "@/stores/searchStore"


export default {
  data() {
    return {
      products: [],
      page: 1,
      lastPage: 1,
      loading: false,
      url: "/api/shop"
    }
  },
    computed: {
      cart() {
        return useCartStore()
      },
      searchStore() {
        return useSearchStore()
      },
      filteredProducts() {
        const q = this.searchStore.query.trim().toLowerCase()
        if (!q) return this.products
        return this.products.filter(item => {
          return (
            (item.title && item.title.toLowerCase().includes(q)) ||
            (item.description && item.description.toLowerCase().includes(q)) ||
            (item.selling_price && String(item.selling_price).includes(q))
          )
        })
      },
      heroAromaticProducts() {
        return this.filteredProducts.slice(0, 2)
      },
      heroFloralProducts() {
        return this.filteredProducts.slice(2, 4)
      },
      heroOrientalProducts() {
        return this.filteredProducts.slice(4, 6)
      },
      remainingProducts() {
        return this.filteredProducts.slice(6)
      }
  },
  mounted() {
     this.cart.load()
    this.fetchProducts()
    window.addEventListener("scroll", this.handleScroll)
  },

  beforeUnmount() {
    window.removeEventListener("scroll", this.handleScroll)
  },

  methods: {
    fetchProducts() {
      if (this.loading || this.page > this.lastPage) return
      this.loading = true

      generaApi.getAndfind(`${this.url}?page=${this.page}`)
        .then(res => {
          this.products.push(...res.data.data)
          this.lastPage = res.data.last_page || 1
          this.page++
        })
        .catch(err => console.error("Shop API error:", err))
        .finally(() => this.loading = false)
    },

    handleScroll() {
      const scrollTop = window.scrollY
      const windowHeight = window.innerHeight
      const docHeight = document.documentElement.scrollHeight

      if (scrollTop + windowHeight + 200 >= docHeight) {
        this.fetchProducts()
      }
    },

    imageUrl(img) {
      if (!img) return 'https://localhost/shopingcart/placeholder.png'
      if (img.startsWith('http')) return img
    // return `https://localhost/shopingcart/public/${img}`

      return `http://127.0.0.1:8000/${img}`
    }
  }
}
</script>


