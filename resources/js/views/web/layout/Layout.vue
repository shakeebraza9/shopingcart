<template>
  <v-app>
    <!-- Header -->
    <v-app-bar app color="primary" dark>
      <v-toolbar-title>Hamari Shop</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn text to="/">Home</v-btn>
      <v-btn text to="/shop">Shop</v-btn>

      <!-- Cart Icon -->
      <v-btn icon @click="cartDrawer = true">
        <v-badge :content="cartItems.length" color="red" v-if="cartItems.length">
          <v-icon>mdi-cart</v-icon>
        </v-badge>
        <v-icon v-else>mdi-cart</v-icon>
      </v-btn>
    </v-app-bar>

    <!-- Page Content -->
    <v-main>
      <router-view :add-to-cart="addToCart" />
    </v-main>

    <!-- Footer -->
    <v-footer app padless>
      <v-col class="text-center py-4">
        &copy; {{ new Date().getFullYear() }} Hamari Shop. All Rights Reserved.
      </v-col>
    </v-footer>

    <!-- Cart Drawer -->
    <CartDrawer :drawer.sync="cartDrawer" :cartItems="cartItems" @close="cartDrawer=false" />
  </v-app>
</template>

<script>
import CartDrawer from "./CartDrawer.vue";

export default {
  name: "Layout",
  components: { CartDrawer },
  data() {
    return {
      cartDrawer: false,
      cartItems: []
    };
  },
  methods: {
    addToCart(item) {
      const existing = this.cartItems.find(i => i.id === item.id);
      if (existing) {
        existing.quantity += 1;
      } else {
        this.cartItems.push({ ...item, quantity: 1 });
      }
      this.cartDrawer = true; // Drawer open on add
    }
  }
};
</script>
