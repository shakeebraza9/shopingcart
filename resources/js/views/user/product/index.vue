<template>
  <v-row>
    <v-col cols="12">

      <v-card class="mt-3" elevation="1">
        <!-- Card Header -->
        <v-card-title class="d-flex justify-space-between align-center">
          <div>
            <h4 class="text-h6 mb-1">Products</h4>
            <div class="text-caption text-grey">
              View all products list
            </div>
          </div>

          <v-btn
            color="primary"
            prepend-icon="mdi-plus"
            to="/admin/product/create"
          >
            Add Product
          </v-btn>
        </v-card-title>

        <v-divider />

        <v-card-text>
          <v-row class="mb-3" align="center">
            <v-col cols="12" md="2">
              <v-select
                label="Length"
                v-model="filter.length"
                :items="[10, 50, 100, 500]"
                density="comfortable"
                variant="outlined"
              />
            </v-col>

            <v-col cols="12" md="4">
              <v-text-field
                label="Search"
                v-model="filter.search"
                clearable
                density="comfortable"
                variant="outlined"
                prepend-inner-icon="mdi-magnify"
              />
            </v-col>

            <v-col cols="12" md="3" class="d-flex ga-2">
              <v-btn color="primary" variant="flat" @click="loadItems">Apply</v-btn>
              <v-btn color="primary" variant="outlined" @click="resetFilter">Reset</v-btn>
            </v-col>
          </v-row>

          <v-data-table-server
            class="border striped-table"
            
            :headers="headers"
            :items="items"
            :items-length="totalItems"
            :loading="loading"
            item-value="id"
            @update:options="loadItems"
          >
            <template #item.img="{ item }">
              <v-img :src="item.image_preview" width="60" height="50" cover class="rounded"/>
            </template>

            <template #item.view="{ item }">
              <v-btn color="primary" variant="tonal" size="small" :to="`/admin/product/edit/${item.id}`">
                <v-icon size="18">mdi-pencil</v-icon>
              </v-btn>

              <v-btn color="red" variant="text" size="small" @click="deleteItem(item.id)">
                <v-icon size="18">mdi-delete-outline</v-icon>
              </v-btn>
            </template>

            <template #bottom>
              <div class="py-3">
                <custom-pagination
                  :loading="loading"
                  v-model:page="filter.page"
                  :lastPage="last_page"
                  @page-changed="loadItems"
                />
              </div>
            </template>

          </v-data-table-server>

        </v-card-text>
      </v-card>

    </v-col>
  </v-row>
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
