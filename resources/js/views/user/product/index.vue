<template>
  <div class="p-6">

    <!-- Card -->
    <div class="bg-white rounded-xl shadow border">

      <!-- Header -->
      <div class="flex items-center justify-between px-6 py-4 border-b">
        <div>
          <h2 class="text-lg font-semibold text-gray-900">Products</h2>
          <p class="text-sm text-gray-500">View all products list</p>
        </div>

        <router-link
          to="/admin/product/create"
          class="inline-flex items-center gap-2
                 px-4 py-2 rounded-lg
                 bg-[#C2A875] text-white text-sm font-medium
                 hover:bg-[#B59A65] transition"
        >
          + Add Product
        </router-link>
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
              placeholder="Search products..."
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
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Image</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Title</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Slug</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Created At</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600">Action</th>
            </tr>
          </thead>

          <tbody>
            <tr v-if="loading">
              <td colspan="6" class="text-center py-6 text-gray-500">
                Loading...
              </td>
            </tr>

            <tr
              v-for="item in items"
              :key="item.id"
              class="border-t hover:bg-gray-50"
            >
              <td class="px-4 py-3 text-sm">{{ item.id }}</td>

              <td class="px-4 py-3">
                <img
                  :src="item.image_preview"
                  class="h-12 w-14 rounded object-cover border"
                />
              </td>

              <td class="px-4 py-3 text-sm">{{ item.title }}</td>
              <td class="px-4 py-3 text-sm text-gray-500">{{ item.slug }}</td>
              <td class="px-4 py-3 text-sm text-gray-500">{{ item.created_at }}</td>

              <td class="px-4 py-3 flex gap-2">
                <router-link
                  :to="`/admin/product/edit/${item.id}`"
                  class="px-3 py-1 rounded bg-blue-50 text-blue-600 text-xs hover:bg-blue-100"
                >
                  Edit
                </router-link>

                <button
                  @click="deleteItem(item.id)"
                  class="px-3 py-1 rounded bg-red-50 text-red-600 text-xs hover:bg-red-100"
                >
                  Delete
                </button>
              </td>
            </tr>

            <tr v-if="!loading && !items.length">
              <td colspan="6" class="text-center py-6 text-gray-500">
                No products found
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Pagination -->
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
      headers: [
        { title: "ID", value: "id", sortable: false },
        { title: "Image", key: "img" },
        { title: "Title", value: "title" },
        { title: "Slug", value: "slug" },
        { title: "Created At", value: "created_at" },
        { title: "Action", key: "view", sortable: false },
      ],
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

    const res = await generaApi.get("/api/products", { params });

    const response = res.data; 
    
    this.items = res.data || [];
    this.totalItems = res.total || 0;
    this.filter.page = Number(res.current_page) || 1;
    this.last_page = Math.ceil((res.total || 0) / (res.per_page || 10));

  } catch (e) {
    console.error("Product fetch failed:", e);
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

    async deleteItem(id) {
      if (!confirm("Are you sure you want to delete this product?")) return;

      try {
        await generaApi.delete(`/api/products/${id}`);
        alert("Product deleted successfully!");
        this.loadItems();
      } catch (e) {
        console.error("Delete failed:", e);
        alert("Failed to delete product.");
      }
    },
  },
};
</script>
