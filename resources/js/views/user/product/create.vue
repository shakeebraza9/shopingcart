<template>
  <v-container fluid class="pa-4">

    <!-- Top Bar -->
    <v-row class="mb-4 align-center">
      <v-col cols="12" class="d-flex justify-space-between">
        <div>
          <h3 class="text-h6 font-weight-medium mb-1">
            Add Product
          </h3>
          <div class="text-caption text-grey">
            Basic product information
          </div>
        </div>

        <v-btn
          icon
          variant="text"
          color="primary"
          to="/admin/product"
        >
          <v-icon>mdi-arrow-left</v-icon>
        </v-btn>
      </v-col>
    </v-row>

    <!-- Card -->
    <v-card elevation="2" rounded="lg">
      <v-card-text class="pa-5">

        <v-form ref="formRef" @submit.prevent="submitForm">

          <v-row>
            <!-- Title -->
            <v-col cols="12" md="6">
              <v-text-field
                v-model="form.title"
                label="Product Title"
                placeholder="Dior Sauvage"
                variant="outlined"
                density="compact"
                hide-details="auto"
                :rules="[rules.required]"
              />
            </v-col>

            <!-- Slug -->
            <v-col cols="12" md="6">
              <v-text-field
                v-model="form.slug"
                label="Slug"
                placeholder="dior-sauvage"
                variant="outlined"
                density="compact"
                hide-details="auto"
                :rules="[rules.required]"
              />
            </v-col>
          </v-row>

          <!-- Actions -->
          <v-row class="mt-4">
            <v-col
              cols="12"
              class="d-flex justify-end ga-2"
            >
              <v-btn
                variant="text"
                color="primary"
                @click="resetForm"
              >
                Reset
              </v-btn>

              <v-btn
                color="primary"
                type="submit"
                :loading="loading"
              >
                Save
              </v-btn>
            </v-col>
          </v-row>

        </v-form>

      </v-card-text>
    </v-card>

  </v-container>
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
    url: "/api/products",
    rules: {
      required: v => !!v || "This field is required",
    },
  };
},
methods: {
  async submitForm() {
    // validate form first
    const valid = await this.$refs.formRef.validate();
    if (!valid) return;

    this.loading = true;
    try {
      const payload = {
        title: this.form.title,
        slug: this.form.slug,
      };

      const response = await generaApi.post(this.url, payload);

      const successMessage = response.data?.message || "Product created successfully!";
      if (this.$alertStore) this.$alertStore.add(successMessage, "success");

      this.resetForm();

    } catch (e) {
      console.error(e);
      const errorMessage = e.response?.data?.message || e.message || "Product creation failed";
      if (this.$alertStore) this.$alertStore.add(errorMessage, "error");
    } finally {
      this.loading = false;
    }
  },

  resetForm() {
    this.form.title = "";
    this.form.slug = "";
    if (this.$refs.formRef) this.$refs.formRef.resetValidation();
  },
},

};
</script>


