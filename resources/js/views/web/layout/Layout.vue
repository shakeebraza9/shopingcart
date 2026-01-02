<template>
  <div class="min-h-screen flex flex-col bg-[#F8F4EC]">


    <header class="sticky top-0 z-50 bg-white/90 backdrop-blur border-b border-black/5">
      <div class="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between">



        <div class="flex items-center gap-6">
          <div
            class="font-serif text-2xl tracking-widest text-gray-900 cursor-pointer"
            @click="$router.push('/')"
          >
            NOORÉ
          </div>
>
          <div class="relative" @keydown.esc="searchStore.suggestions = []">
            <input
              v-model="searchStore.query"
              type="text"
              placeholder="Search products…"
              class="px-4 py-2 w-44 md:w-64 rounded-full bg-white/40 border border-gray-200 focus:outline-none focus:ring-2 focus:ring-[#C9A24D] text-gray-900 placeholder-gray-400 transition shadow-sm"
              @input="onSearchInput"
              
              @blur="onBlur"
              autocomplete="on"
            />
            <button
              v-if="searchStore.query"
              @click="searchStore.clear()"
              class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400"
              tabindex="-1"
            >
              ✕
            </button>
 
            <div v-if="searchStore.query.length > 1 && (searchStore.loadingSuggestions || searchStore.suggestions.length > 0)" class="absolute left-0 mt-2 w-full bg-white rounded-xl shadow-lg border border-gray-100 z-50 overflow-hidden">
              <div v-if="searchStore.loadingSuggestions" class="p-4 text-center text-gray-400 text-sm">Loading...</div>
              <template v-else>
                <div v-if="searchStore.suggestions.length === 0" class="p-4 text-center text-gray-400 text-sm">No products found</div>
                <ul v-else>
                  <li v-for="item in searchStore.suggestions" :key="item.id" @mousedown.prevent="goToProduct(item)" class="flex items-center gap-3 px-4 py-2 hover:bg-gray-50 cursor-pointer">
                    <img :src="item.image || 'https://localhost/shopingcart/public/placeholder.png'" class="w-10 h-10 object-cover rounded-lg bg-gray-100" />
                    <div class="flex-1">
                      <div class="font-medium text-gray-900 text-sm line-clamp-1">{{ item.title }}</div>
                      <div class="text-xs text-[#C2A875] font-semibold">Rs. {{ Number(item.selling_price).toLocaleString() }}</div>
                    </div>
                  </li>
                </ul>
              </template>
            </div>
          </div>
        </div>

        <!-- NAV -->
        <nav class="hidden md:flex items-center gap-10 text-sm font-medium text-gray-700">
          <router-link
            to="/"
            class="hover:text-black transition"
          >
            Home
          </router-link>
<!-- 
          <router-link
            to="/shop"
            class="hover:text-black transition"
          >
            Shop
          </router-link> -->
        </nav>


        <div class="flex items-center gap-4">

          <template v-if="!userStore.is_logged_in">
            <button @click="$router.push('/login')" class="p-2 rounded-full hover:bg-black/5 transition" title="Login">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M5.121 17.804A9 9 0 1112 21a8.963 8.963 0 01-6.879-3.196z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
            </button>
            <button @click="$router.push('/register')" class="p-2 rounded-full hover:bg-black/5 transition" title="Register">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M12 4v16m8-8H4" />
              </svg>
            </button>
          </template>
          <!-- Profile Icon with Name & Logout -->
          <template v-else>
            <div class="flex items-center gap-2 px-3 py-1 rounded-full bg-gray-100 border border-gray-200">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M5.121 17.804A9 9 0 1112 21a8.963 8.963 0 01-6.879-3.196z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              <span class="text-gray-800 font-medium text-sm">{{ userStore.user?.name || userStore.user?.firstName }}</span>
              <button @click="logout" class="ml-2 p-2 rounded-full hover:bg-red-100 transition" title="Logout">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M17 16l4-4m0 0l-4-4m4 4H7" />
                </svg>
              </button>
            </div>
          </template>
          <!-- Cart Icon -->
          <button
            @click="cartDrawer = true"
            class="relative p-2 rounded-full hover:bg-black/5 transition"
          >
            <!-- Badge -->
            <span
              v-if="cart.count"
              class="absolute -top-1 -right-1 h-5 w-5 text-xs rounded-full bg-[#C2A875] text-white flex items-center justify-center"
            >
              {{ cart.count }}
            </span>
            <!-- Icon -->
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-6 w-6 text-gray-800"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="1.8"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13l-1.35 2.7A1 1 0 007 17h10m-10 0a1 1 0 100 2 1 1 0 000-2zm10 0a1 1 0 100 2 1 1 0 000-2"
              />
            </svg>
          </button>
        </div>
      </div>
    </header>

    <!-- PAGE CONTENT -->
    <main class="flex-1">
      <router-view  />
    </main>

    <!-- FOOTER -->
    <footer class="bg-white border-t border-black/5">
      <div class="max-w-7xl mx-auto px-6 py-8 text-center text-sm text-gray-500">
        © {{ new Date().getFullYear() }} NOORÉ — Crafted with elegance.
      </div>
    </footer>

    <!-- CART DRAWER -->
    <CartDrawer
      :drawer="cartDrawer"
      
      @close="cartDrawer = false"
    />
  </div>
</template>

<!-- <script setup>
import { ref, onMounted } from 'vue';
import CartDrawer from './CartDrawer.vue';
import { useCartStore } from '@/stores/cartStore';

const cartDrawer = ref(false);
const cart = useCartStore();

onMounted(() => {
  cart.load(); // localStorage se cart load
});
</script> -->



<script>

import { useCartStore } from "@/stores/cartStore"
import { useUserStore } from "@/stores/userStore"
import { useSearchStore } from "@/stores/searchStore"
import CartDrawer from "./CartDrawer.vue"
import { ref, onMounted } from 'vue';


export default {
  components: { CartDrawer },

  data() {
    return {
      cartDrawer: false
    }
  },

  computed: {
    cart() {
      return useCartStore()
    },
    userStore() {
      return useUserStore()
    }
      ,
      searchStore() {
        return useSearchStore()
      }
  },
   mounted() {
    this.cart.load(this.userStore.user?.id || null)
  },
  methods: {
      async logout() {
         try {
        await this.userStore.logOut()
      } finally {
        this.$router.replace('/login')
      }
      },
    onSearchInput() {
      this.searchStore.setQuery(this.searchStore.query)
    },
    onBlur() {
    setTimeout(() => {
      this.searchStore.clearSuggestions()
    }, 200)
  },
    goToProduct(item) {
      this.$router.push(`/shop/${item.slug || item.id}`)
      this.searchStore.clear()
    }
  }
}
</script>
