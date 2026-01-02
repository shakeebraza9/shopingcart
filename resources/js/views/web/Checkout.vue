<template>
  <div class="bg-white min-h-screen">
    <!-- Page Title -->
    <div class="text-center py-10">
      <h1 class="text-xl font-semibold tracking-wide">CHECKOUT PAGE</h1>
    </div>

    <!-- Content -->
    <div class="max-w-6xl mx-auto px-4 pb-20">
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-10">

        <!-- Billing Details -->
        <div class="border border-gray-200 p-6">
          <h2 class="font-semibold mb-6">Billing details</h2>

          <div class="space-y-4">
            <input class="input" placeholder="Fullname *" />
            <input class="input" placeholder="Phone *" />
            <input class="input" placeholder="Email" />

            <div class="grid grid-cols-2 gap-4">
              <select class="input">
                <option>Pakistan</option>
              </select>
              <input class="input" placeholder="City *" />
            </div>

            <textarea class="input" rows="3" placeholder="Address *"></textarea>

            <select class="input">
              <option>Cash on Delivery</option>
            </select>

            <p class="text-sm font-medium pt-2">Cash on Delivery</p>
          </div>
        </div>

        <!-- Order Summary -->
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
              <tr class="border-b">
                <td class="py-3 text-red-600">Sample Product</td>
                <td>PKR 9750</td>
                <td>1</td>
                <td class="text-right">PKR 9750</td>
              </tr>
            </tbody>
          </table>

          <div class="mt-4 text-sm space-y-2">
            <div class="flex justify-between">
              <span>Subtotal</span>
              <span>PKR 9750</span>
            </div>
            <div class="flex justify-between">
              <span>Delivery</span>
              <span>PKR 250</span>
            </div>
            <div class="flex justify-between font-semibold border-t pt-2">
              <span>Grand Total</span>
              <span>PKR 10000</span>
            </div>
          </div>

          <textarea class="input mt-4" rows="3" placeholder="Order Notes"></textarea>

          <button class="mt-6 bg-black text-white px-6 py-3 text-sm hover:bg-gray-800">
            PLACE ORDER
          </button>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Checkout",
};
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
