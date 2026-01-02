<template>
  <div class="p-4">
    <!-- Top Bar -->
    <div class="mb-4 flex items-center justify-between">
      <div>
        <h3 class="mb-1 text-lg font-medium text-gray-800 dark:text-gray-100">
          Add Product
        </h3>
        <p class="text-sm text-gray-500">
          Basic product information
        </p>
      </div>

      <router-link
        to="/admin/product"
        class="rounded-md p-2 text-blue-600 hover:bg-blue-50 dark:hover:bg-gray-800"
      >
        <i class="mdi mdi-arrow-left text-xl"></i>
      </router-link>
    </div>

    <!-- Card -->
    <div class="rounded-lg bg-white shadow-md dark:bg-gray-900">
      <div class="p-5">
        <form @submit.prevent="submitForm" ref="formRef" class="space-y-4">
          <!-- Inputs -->
          <div class="grid grid-cols-1 gap-4 md:grid-cols-2">
            <!-- Title -->
            <div>
              <label class="form-label">Product Title</label>
              <input
                v-model="form.title"
                type="text"
                placeholder="Dior Sauvage"
                class="form-input"
              />
              <p v-if="errors.title" class="form-error">
                {{ errors.title }}
              </p>
            </div>

            <!-- Slug -->
            <div>
              <label class="form-label">Slug</label>
              <input
                v-model="form.slug"
                type="text"
                placeholder="dior-sauvage"
                class="form-input"
              />
              <p v-if="errors.slug" class="form-error">
                {{ errors.slug }}
              </p>
            </div>
          </div>

          <!-- Actions -->
          <div class="flex justify-end gap-3 pt-4">
            <button
              type="button"
              @click="resetForm"
              class="rounded-md px-4 py-2 text-blue-600 hover:bg-blue-50 dark:hover:bg-gray-800"
            >
              Reset
            </button>

            <button
              type="submit"
              :disabled="loading"
              class="rounded-md bg-blue-600 px-6 py-2 text-white hover:bg-blue-700 disabled:opacity-50"
            >
              <span v-if="!loading">Save</span>
              <span v-else>Saving...</span>
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>



<script>
import generaApi from "@/models/general.model";

export default {
  data() {
    return {
      loading: false,
      form: {
        title: "",
        slug: "",
      },
      errors: {
        title: "",
        slug: "",
      },
      url: "/api/products",
    };
  },

  methods: {
    validateForm() {
      this.errors.title = this.form.title ? "" : "This field is required";
      this.errors.slug = this.form.slug ? "" : "This field is required";

      return !this.errors.title && !this.errors.slug;
    },

    async submitForm() {
      if (!this.validateForm()) return;

      this.loading = true;
      try {
        const payload = {
          title: this.form.title,
          slug: this.form.slug,
        };

        const response = await generaApi.post(this.url, payload);

        const successMessage =
          response.data?.message || "Product created successfully!";
        if (this.$alertStore)
          this.$alertStore.add(successMessage, "success");

        this.resetForm();
      } catch (e) {
        console.error(e);
        const errorMessage =
          e.response?.data?.message ||
          e.message ||
          "Product creation failed";
        if (this.$alertStore)
          this.$alertStore.add(errorMessage, "error");
      } finally {
        this.loading = false;
      }
    },

    resetForm() {
      this.form.title = "";
      this.form.slug = "";
      this.errors.title = "";
      this.errors.slug = "";
    },
  },
};
</script>



