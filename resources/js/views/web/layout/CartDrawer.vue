<template>
  <v-navigation-drawer
    :model-value="drawer"
    location="right"
    width="400"
    temporary
    @update:model-value="$emit('update:drawer', $event)"
  >
    <v-toolbar flat color="primary">
      <v-toolbar-title class="white--text">Your Cart</v-toolbar-title>
      <v-spacer />
      <v-btn icon @click="$emit('update:drawer', false)">
        <v-icon color="white">mdi-close</v-icon>
      </v-btn>
    </v-toolbar>

    <v-divider />

    <v-card-text v-if="!cartItems.length" class="text-center py-10">
      Your cart is empty
    </v-card-text>

    <v-list v-else dense>
      <v-list-item v-for="(item, index) in cartItems" :key="index">
        <v-list-item-avatar>
          <v-img :src="item.image || 'https://via.placeholder.com/50'" />
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item-title>{{ item.title }}</v-list-item-title>
          <v-list-item-subtitle>Rs. {{ item.price }}</v-list-item-subtitle>
          <v-list-item-subtitle>Qty: {{ item.quantity }}</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
    </v-list>

    <v-divider />

    <v-card-actions v-if="cartItems.length">
      <v-btn color="primary" block @click="checkout">
        Checkout
      </v-btn>
    </v-card-actions>
  </v-navigation-drawer>
</template>

<script>
export default {
  name: "CartDrawer",
  props: {
    drawer: { type: Boolean, required: true },
    cartItems: { type: Array, default: () => [] }
  },
  methods: {
    checkout() {
      alert("Proceed to checkout");
    }
  }
};
</script>
