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
          </div>
        </div>

        <div class="flex items-center gap-4">

          <template v-if="!userStore.is_logged_in">
            <button @click="$router.push('/login')" class="p-2 rounded-full hover:bg-black/5 transition" title="Login">Login</button>
            <button @click="$router.push('/register')" class="p-2 rounded-full hover:bg-black/5 transition" title="Register">Register</button>
          </template>
          <template v-else>
            <div class="flex items-center gap-2 px-3 py-1 rounded-full bg-gray-100 border border-gray-200">
              <span class="text-gray-800 font-medium text-sm">{{ userStore.user?.name || userStore.user?.firstName }}</span>
              <button @click="logout" class="ml-2 p-2 rounded-full hover:bg-red-100 transition">Logout</button>
            </div>
          </template>

          <button @click="cartDrawer = true" class="relative p-2 rounded-full hover:bg-black/5 transition">
            <span v-if="cart.items.length" class="absolute -top-1 -right-1 h-5 w-5 text-xs rounded-full bg-[#C2A875] text-white flex items-center justify-center">
              {{ cart.items.length }}
            </span>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-800" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13l-1.35 2.7A1 1 0 007 17h10m-10 0a1 1 0 100 2 1 1 0 000-2zm10 0a1 1 0 100 2 1 1 0 000-2" />
            </svg>
          </button>
        </div>
      </div>
    </header>


    <div v-if="cartDrawer" class="fixed inset-0 z-50 bg-black/40 backdrop-blur-sm" @click.self="cartDrawer = false">
      <div class="absolute right-0 top-0 h-full w-full max-w-md bg-[#F9F6F1] shadow-2xl transform transition-transform duration-300 ease-out">
        <!-- HEADER -->
        <div class="flex items-center justify-between px-6 py-5 border-b">
          <h2 class="text-xl font-serif font-semibold text-gray-900">Your Cart</h2>
          <button @click="cartDrawer = false" class="text-gray-500 hover:text-gray-900 transition">✕</button>
        </div>

        <!-- CART ITEMS -->
        <div class="flex-1 overflow-y-auto px-6 py-6">
          <div v-if="!cart.items.length" class="text-center text-gray-500 mt-20">
            Your cart is empty
          </div>

          <div v-else class="space-y-6">
            <div v-for="item in cart.items" :key="item.id" class="flex gap-4 border-b pb-4 items-center">
              <img :src="item.image || '/images/placeholder.png'" class="w-16 h-20 object-contain rounded-lg bg-white" />
              <div class="flex-1">
                <h4 class="text-sm font-medium text-gray-900">{{ item.title }}</h4>
                <p class="text-sm text-gray-500 mt-1">Rs. {{ Number(item.price).toLocaleString() }}</p>

                <div class="flex items-center gap-2 mt-2">
                  <button @click="updateQty(item, -1)" :disabled="item.quantity <= 1" class="px-2 py-1 bg-gray-200 rounded">−</button>
                  <input type="number" :value="item.quantity" min="1" @input="setQty(item, $event.target.value)" class="w-12 text-center border rounded" />
                  <button @click="updateQty(item, 1)" class="px-2 py-1 bg-gray-200 rounded">+</button>
                </div>

                <button @click="removeItem(item)" class="mt-2 text-xs text-red-500 hover:underline">Remove</button>
              </div>
            </div>
          </div>
        </div>

        <!-- TOTAL & CHECKOUT -->
        <div v-if="cart.items.length" class="px-6 py-5 border-t bg-white">
          <div class="flex justify-between items-center mb-4">
            <span class="font-medium text-gray-700">Total:</span>
            <span class="font-semibold text-[#C2A875]">Rs. {{ cartTotal.toLocaleString() }}</span>
          </div>
          <button @click="checkout" class="w-full py-3 rounded-full bg-[#C2A875] text-white font-medium tracking-wide hover:bg-[#B59A65] transition">Proceed to Checkout</button>
        </div>
      </div>
    </div>


    <main class="flex-1">
      <router-view />
    </main>


    <footer class="bg-white border-t border-black/5">
      <div class="max-w-7xl mx-auto px-6 py-8 text-center text-sm text-gray-500">
        © {{ new Date().getFullYear() }} NOORÉ — Crafted with elegance.
      </div>
    </footer>

  </div>
</template>

<script>
import { useCartStore } from "@/stores/cartStore"
import { useUserStore } from "@/stores/userStore"
import { useSearchStore } from "@/stores/searchStore"

export default {
  data() {
    return { cartDrawer: false }
  },
  computed: {
    cart() { return useCartStore() },
    userStore() { return useUserStore() },
    searchStore() { return useSearchStore() },
    cartTotal() {
      return this.cart.items.reduce((sum, item) => sum + Number(item.price) * Number(item.quantity), 0)
    }
  },
  mounted() {
    this.cart.load()
  },
    methods: {
      async logout() {
        try {
          await this.userStore.logOut()       

          // clear cart
          const cart = useCartStore()
          cart.items = []
          cart.save()
          cart.drawerOpen = false

        } finally {
          this.$router.replace('/login')      
        }
      },

    onSearchInput() { this.searchStore.setQuery(this.searchStore.query) },
    onBlur() { setTimeout(() => this.searchStore.clearSuggestions(), 200) },


    updateQty(item, delta) {
      item.quantity += delta
      if (item.quantity < 1) item.quantity = 1
      this.cart.save()
    },
    setQty(item, qty) {
      item.quantity = Number(qty) || 1
      this.cart.save()
    },
    removeItem(item) {
      this.cart.items = this.cart.items.filter(i => i.id !== item.id)
      this.cart.save()
    },
    checkout() {
      if (!this.cart.items.length) return alert('Cart is empty')
      if (!this.userStore.is_logged_in) return this.$router.push('/login')
      this.$router.push('/checkout')
      this.cartDrawer = false
    },
    goToProduct(item) {
      this.$router.push(`/shop/${item.slug || item.id}`)
      this.searchStore.clear()
    }
  }
}
</script>
