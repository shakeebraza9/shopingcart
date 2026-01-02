<template>
        <div
          v-if="drawer"
          class="fixed inset-0 z-50 bg-black/40 backdrop-blur-sm"
          @click.self="$emit('close')"
        >

          <div
            class="absolute right-0 top-0 h-full w-full max-w-md
                   bg-[#F9F6F1] shadow-2xl
                   transform transition-transform duration-300 ease-out"
            :class="drawer ? 'translate-x-0' : 'translate-x-full'"
          >
 
            <div class="flex items-center justify-between px-6 py-5 border-b">
              <h2 class="text-xl font-serif font-semibold text-gray-900">
                Your Cart
              </h2>
              <button
                @click="$emit('close')"
                class="text-gray-500 hover:text-gray-900 transition"
              >
                ✕
              </button>
            </div>

            <div class="flex-1 overflow-y-auto px-6 py-6">
 
              <div
                v-if="!cart.items.length"
                class="text-center text-gray-500 mt-20"
              >
                Your cart is empty
              </div> 
         
              <div v-else class="space-y-6">
                <div
                  v-for="item in cart.items"
                  :key="item.id"
                  class="flex gap-4 border-b pb-4 items-center"
                >
    
                  <img
                          :src="item.image? (item.image.startsWith('http')? item.image : `https://localhost/shopingcart/public/${item.image}`) : placeholder"
                    class="w-16 h-20 object-contain rounded-lg bg-white"
                  />
                  <!-- <img
                    :src="item.image || 'https://via.placeholder.com/50'"
                    class="w-16 h-20 object-contain rounded-lg bg-white"
                  /> -->

                  <!-- INFO -->
                  <div class="flex-1">
                    <h4 class="text-sm font-medium text-gray-900">
                      {{ item.product?.title || item.title }}
                    </h4>
                    <p class="text-sm text-gray-500 mt-1">
                      Rs. {{ cart.itemTotal(item).toLocaleString() }}
                    </p>
                    <!-- QTY BOX -->
                    <div class="flex items-center gap-2 mt-2">
                      <button
                        class="px-2 py-1 bg-gray-200 rounded"
                        @click="cart.updateQty(item.id, item.quantity - 1)"
                        :disabled="item.quantity <= 1"
                      >-</button>
                      <input
                        type="number"
                        min="1"
                        :value="item.quantity"
                        @input="cart.updateQty(item.id, Number($event.target.value))"
                        class="w-12 text-center border rounded"
                      />
                      <button
                        class="px-2 py-1 bg-gray-200 rounded"
                        @click="cart.updateQty(item.id, item.quantity + 1)"
                      >+</button>
                    </div>
    
                    <button
                      class="mt-2 text-xs text-red-500 hover:underline"
                      @click="cart. removeItem(item.id, userStore.user?.id)"
                    >Remove</button>
                  </div>
                </div>
              </div>
            </div>

            <div
              v-if="cart.items.length"
              class="px-6 py-5 border-t bg-white"
            >
              <button
                
                @click="checkout"
                class="w-full py-3 rounded-full
                       bg-[#C2A875] text-white
                       font-medium tracking-wide
                       hover:bg-[#B59A65] transition"
              >
                Proceed to Checkout
              </button>
            </div>
          </div>
        </div>
      </template>


<script setup>
import { useCartStore } from '@/stores/cartStore'
import { useUserStore } from '@/stores/userStore'
import { computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'

const props = defineProps({
  drawer: {
    type: Boolean,
    required: true
  }
})

const cart = useCartStore()
const userStore = useUserStore()
const router = useRouter()

const placeholder = computed(() => '/images/placeholder.png')

onMounted(() => {

  if (userStore.is_logged_in) {
    cart.load()
  }
})

function checkout() {
  // guard: empty cart
  if (!cart.items.length) {
    alert('Your cart is empty')
    return
  }

  // guard: not logged in
  if (!userStore.is_logged_in) {
    router.push('/login')
    return
  }

  router.push('/checkout')
}
</script>
