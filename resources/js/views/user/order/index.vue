<template>
  <div class="p-6">

    <!-- Card -->
    <div class="bg-white rounded-xl shadow border">

      <!-- Header -->
      <div class="flex items-center justify-between px-6 py-4 border-b">
        <div>
          <h2 class="text-lg font-semibold text-gray-900">Orders</h2>
          <p class="text-sm text-gray-500">View all orders list</p>
        </div>
      </div>

      <!-- Filters -->
      <div class="px-6 py-4 border-b">
        <div class="grid grid-cols-1 md:grid-cols-12 gap-4 items-end">

          <!-- Length -->
          <div class="md:col-span-2">
            <label class="block text-sm text-gray-600 mb-1">Length</label>
            <select
              v-model="filter.length"
              class="w-full rounded-lg border px-3 py-2 text-sm focus:ring-2 focus:ring-[#C2A875]"
            >
              <option v-for="n in [10,50,100,500]" :key="n" :value="n">
                {{ n }}
              </option>
            </select>
          </div>

          <!-- Search -->
          <div class="md:col-span-4">
            <label class="block text-sm text-gray-600 mb-1">Search</label>
            <input
              v-model="filter.search"
              type="text"
              placeholder="Search orders..."
              class="w-full rounded-lg border px-3 py-2 text-sm focus:ring-2 focus:ring-[#C2A875]"
            />
          </div>

          <!-- Actions -->
          <div class="md:col-span-3 flex gap-3">
            <button
              @click="loadItems"
              class="px-4 py-2 rounded-lg bg-[#C2A875] text-white text-sm hover:bg-[#B59A65]"
            >
              Apply
            </button>

            <button
              @click="resetFilter"
              class="px-4 py-2 rounded-lg border text-sm text-gray-700 hover:bg-gray-50"
            >
              Reset
            </button>
          </div>
        </div>
      </div>

      <!-- Table -->
      <div class="overflow-x-auto">
        <table class="min-w-full border-collapse">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">ID</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Customer Name</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Phone</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Status</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Payment</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Payment Method</th>
         
            </tr>
          </thead>

          <tbody>
            <tr v-if="loading">
              <td colspan="7" class="text-center py-6 text-gray-500">Loading...</td>
            </tr>

            <tr v-for="order in items" :key="order.id" class="border-t hover:bg-gray-50">
              <td class="px-4 py-3 text-sm">{{ order.id }}</td>
              <td class="px-4 py-3 text-sm">{{ order.customer_name }}</td>
              <td class="px-4 py-3 text-sm">{{ order.customer_phone }}</td>
              <td class="px-4 py-3 text-sm">{{ order.order_status }}</td>
              <td class="px-4 py-3 text-sm">{{ order.payment_status }}</td>
              <td class="px-4 py-3 text-sm">{{ order.payment_method }}</td>
              <td class="px-4 py-3 flex gap-2">
        
              </td>
            </tr>

            <tr v-if="!loading && !items.length">
              <td colspan="7" class="text-center py-6 text-gray-500">
                No orders found
              </td>
            </tr>
          </tbody>
        </table>
      </div>

 
      <div class="px-6 py-4 border-t">
        <custom-pagination
          :loading="loading"
          v-model:page="filter.page"
          :lastPage="last_page"
          @page-changed="loadItems"
        />
      </div>

    </div>
  </div>
</template>

<script>
import generaApi from "@/models/general.model";

export default {
  data() {
    return {
      filter: {
        search: "",
        length: 10,
        page: 1,
      },
      items: [],
      totalItems: 0,
      last_page: 1,
      loading: false,
    };
  },
  mounted() {
    this.loadItems();
  },
  methods: {
    async loadItems() {
      this.loading = true;
      try {
        const params = {
          page: this.filter.page,
          length: this.filter.length,
          search: this.filter.search,
        };

        const res = await generaApi.get("/api/orders", { params });
        const data = res.data;

        this.items = data || [];
        this.totalItems = data.total || 0;
        this.filter.page = data.current_page || 1;
        this.last_page = Math.ceil((data.total || 0) / (data.per_page || 10));
      } catch (e) {
        console.error("Orders fetch failed:", e);
        this.items = [];
        this.totalItems = 0;
      } finally {
        this.loading = false;
      }
    },

    resetFilter() {
      this.filter.search = "";
      this.filter.length = 10;
      this.filter.page = 1;
      this.loadItems();
    },
  },
};
</script>
