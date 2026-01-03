<template>
  <div class="bg-white min-h-screen">

    <div class="text-center py-10">
      <h1 class="text-xl font-semibold tracking-wide">CHECKOUT PAGE</h1>
    </div>

    <div class="max-w-6xl mx-auto px-4 pb-20">
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-10">

        <!-- BILLING DETAILS -->
        <div class="border border-gray-200 p-6">
          <h2 class="font-semibold mb-6">Billing details</h2>
          <div class="space-y-4">
            <input v-model="form.name" class="input" placeholder="Fullname *" />
            <input v-model="form.phone" class="input" placeholder="Phone *" />
            <input v-model="form.email" class="input" placeholder="Email" />

            <div class="grid grid-cols-2 gap-4">
              <select v-model="form.country" class="input">
                <option>Pakistan</option>
              </select>
              <input v-model="form.city" class="input" placeholder="City *" />
            </div>

            <textarea v-model="form.address" class="input" rows="3" placeholder="Address *"></textarea>

            <select v-model="form.payment_method" class="input">
              <option>Cash on Delivery</option>
            </select>

            <p class="text-sm font-medium pt-2">Cash on Delivery</p>
          </div>
        </div>

        <!-- ORDER SUMMARY -->
        <div class="border border-gray-200 p-6">
          <h2 class="font-semibold mb-4">Your Order</h2>

          <table class="w-full text-sm border-t border-b">
            <thead class="border-b">
              <tr>
                <th class="text-left py-2">Product</th>
                <th>Price</th>
                <th>Qty</th>
                <th class="text-right">Total</th>
              </tr>
            </thead>

            <tbody>
              <tr v-for="item in cart.items" :key="item.id" class="border-b">
                <td class="py-3 text-red-600">{{ item.title }}</td>
                <td>PKR {{ item.price }}</td>
                <td>{{ item.quantity }}</td>
                <td class="text-right">PKR {{ (item.price * item.quantity).toLocaleString() }}</td>
              </tr>
            </tbody>
          </table>

          <div class="mt-4 text-sm space-y-2">
            <div class="flex justify-between">
              <span>Subtotal</span>
              <span>PKR {{ subtotal }}</span>
            </div>
            <div class="flex justify-between">
              <span>Delivery</span>
              <span>PKR {{ delivery }}</span>
            </div>
            <div class="flex justify-between font-semibold border-t pt-2">
              <span>Grand Total</span>
              <span>PKR {{ grandTotal }}</span>
            </div>
          </div>

          <textarea v-model="form.order_notes" class="input mt-4" rows="3" placeholder="Order Notes"></textarea>

          <button @click="placeOrder" class="mt-6 bg-black text-white px-6 py-3 text-sm hover:bg-gray-800">
            PLACE ORDER
          </button>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
import { useCartStore } from "@/stores/cartStore"
import { useUserStore } from "@/stores/userStore"
import generaApi from "@/models/general.model"

export default {
  name: "Checkout",
  data() {
  
    return {
      form: {
        name: "",
        phone: "",
        email: "",
        country: "Pakistan",
        city: "",
        address: "",
        payment_method: 1,
        order_notes: ""
      },
      delivery: 250 ,
      url:"/api/checkout",
    }
  },
  computed: {
    cart() { return useCartStore() },
    userStore() { return useUserStore() },
    subtotal() {
      return this.cart.items.reduce((sum, i) => sum + i.price * i.quantity, 0)
    },
    grandTotal() {
      return this.subtotal + this.delivery
    }
  },
  mounted() {

    if (this.userStore.is_logged_in) {
      this.form.name = this.userStore.user.name || ""
      this.form.email = this.userStore.user.email || ""
      this.form.phone = this.userStore.user.phone || ""
    }
  },
methods: {
  async placeOrder() {
    if (!this.cart.items.length) return alert("Your cart is empty")

    const orderData = {
      name: this.form.name,
      phone: this.form.phone,
      email: this.form.email,
      country: this.form.country,
      city: this.form.city,
      address: this.form.address,
      order_notes: this.form.order_notes,
      payment_method: this.form.payment_method, 
      cart_items: this.cart.items.map(i => ({
        variation_id: i.variation_id || i.id,
        title: i.title,
        sku: "200 ml",
        price: i.price,
        quantity: i.quantity,
        total: i.price * i.quantity,
        attributes: i.attributes || {},
        image: i.image || ""
      }))
    }

    try {
      const response = await generaApi.post(this.url, orderData)  // <-- send orderData
      alert("Order placed successfully!")
      console.log("Order response:", response.data)

      // Clear cart
      this.cart.items = []
      this.cart.save()

      this.$router.push("/")  // redirect to home
    } catch (err) {
      console.error("Checkout error:", err)
      alert("Failed to place order.")
    }
  }
}

}
</script>

<style scoped>
.input {
  width: 100%;
  border: 1px solid #e5e7eb;
  padding: 10px 12px;
  font-size: 14px;
}
.input:focus {
  outline: none;
  border-color: black;
}
</style>
