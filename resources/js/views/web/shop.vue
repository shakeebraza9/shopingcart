<template>
  <v-container class="py-16">

    <!-- Header -->
    <div class="text-center mb-10">
      <h2 class="text-h4 font-weight-bold mb-2">Hamari Shop</h2>
      <p class="text-medium-emphasis">
        Behtareen quality ke products munasib keemat mein
      </p>
    </div>

    <!-- Products -->
    <v-row v-if="products.length" dense>
      <v-col
        v-for="item in products"
        :key="item.id"
        cols="12"
        sm="6"
        md="4"
        lg="3"
      >
        <v-card
          class="rounded-xl"
          elevation="3"
          hover
        >
          <!-- Image -->
          <v-img
            :src="imageUrl(item.image)"
            height="220"
            cover
          >
            <!-- Featured -->
            <v-chip
              v-if="item.is_featured"
              color="primary"
              size="small"
              class="ma-2"
              label
            >
              Featured
            </v-chip>

            <!-- Sale -->
            <v-chip
              v-if="item.selling_price < item.price"
              color="red"
              size="small"
              class="ma-2"
              label
              location="end"
            >
              Sale
            </v-chip>
          </v-img>

          <!-- Content -->
          <v-card-text>
            <div class="text-subtitle-1 font-weight-bold mb-1">
              {{ item.title }}
            </div>

            <div class="text-caption text-medium-emphasis mb-3">
              {{ item.details || item.description || '—' }}
            </div>

            <div class="d-flex align-center gap-2">
              <span class="text-h6 text-primary font-weight-bold">
                Rs. {{ Number(item.selling_price).toLocaleString() }}
              </span>

              <span
                v-if="item.selling_price < item.price"
                class="text-caption text-decoration-line-through"
              >
                Rs. {{ Number(item.price).toLocaleString() }}
              </span>
            </div>
          </v-card-text>

          <!-- Actions -->
          <v-card-actions>
            <v-btn
              color="primary"
              block
              rounded="lg"
            >
              Buy Now
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>

    <!-- Loading -->
    <div v-if="loading" class="text-center py-16">
      <v-progress-circular indeterminate color="primary" />
    </div>

    <!-- Pagination -->
    <div class="d-flex justify-center mt-10" v-if="pagination.last_page > 1">
      <v-pagination
        v-model="page"
        :length="pagination.last_page"
        @update:modelValue="changePage"
      />
    </div>

  </v-container>
</template>



<script>
import generaApi from "@/models/general.model"

export default {
  data() {
    return {
      // filters (future use)
      filter: {
        search: "",
        length: 10,
        page: 1,
        offset: 0,
        start_date: "",
        end_date: "",
        user_id: null,
        status: null
      },

      products: [],
      pagination: {},
      loading: false,

      url: "/api/shop"
    }
  },

  mounted() {
    this.fetchProducts()
  },

  methods: {
    fetchProducts(page = 1) {
      this.loading = true

      generaApi
        .getAndfind(`${this.url}?page=${page}`)
        .then(res => {
          // your exact API structure
          this.products = res.data.data
          this.pagination = res.data
        })
        .catch(err => {
          console.error("Shop API error:", err)
        })
        .finally(() => {
          this.loading = false
        })
    },

    changePage(page) {
      if (!page) return
      this.fetchProducts(page)
    },

    imageUrl(img) {
    if (!img) {
        return 'https://localhost/shopingcart/placeholder.png'
    }

    // agar already full URL ho
    if (img.startsWith('http')) {
        return img
    }

    return `https://localhost/shopingcart/public/${img}`
    }
  }
}
</script>

