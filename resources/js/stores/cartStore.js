
import { defineStore } from "pinia";
// import api from "@/models/api";

export const useCartStore = defineStore("cart", {
  state: () => ({
    items: [],
  }),
  getters: {
    count: (state) =>
      state.items.reduce((t, i) => t + i.quantity, 0),
    isInCart: (state) => (id) => state.items.some(i => i.id === id),
    totalPrice: (state) =>
      state.items.reduce((t, i) => t + i.price * i.quantity, 0),
       itemTotal: () => (item) => {
    return item.price * item.quantity
  },

  cartSubtotal: (state) => {
    return state.items.reduce(
      (total, item) => total + item.price * item.quantity,
      0
    )
  }
    // count: (state) => state.items.reduce((t, i) => t + i.quantity, 0),
    // isInCart: (state) => (id) => state.items.some(i => i.product_id === id),
    // totalPrice: (state) => state.items.reduce((t, i) => t + (i.product?.selling_price || i.price) * i.quantity, 0),
    // itemTotal: () => (item) => (item.product?.selling_price || item.price) * item.quantity,
    // cartSubtotal: (state) => state.items.reduce((total, item) => total + (item.product?.selling_price || item.price) * item.quantity, 0),
  },
  actions: {
    getKey(userId = null) {
      return userId ? `cart_user_${userId}` : "cart_guest";
    },

    load(userId = null) {
      const key = this.getKey(userId);
      this.items = JSON.parse(localStorage.getItem(key) || "[]");
    },

    save(userId = null) {
      const key = this.getKey(userId);
      localStorage.setItem(key, JSON.stringify(this.items));
    },

    add(product, qty = 1, userId = null) {
      const found = this.items.find(i => i.id === product.id);
      
      const imageUrl = product.image
    ? (product.image.startsWith("http")
        ? product.image
        : `http://127.0.0.1:8000/${product.image}`)
    : null;

      if (found) {
        found.quantity += qty;
      } else {
        this.items.push({
          id: product.id,
          title: product.title,
          price: product.selling_price,
          image: imageUrl,
          quantity: qty,
        });
      }
      this.save(userId);
    },
    clear(userId = null) {
      const key = this.getKey(userId);
      localStorage.removeItem(key);
    // async load() {
    //   try {
    //     const res = await api.get("/cart");
    //     this.items = res.data.data || [];
    //   } catch (e) {
    //     this.items = [];
    //   }
    // },
    // async add(product, qty = 1) {
    //   try {
    //     const res = await api.post("/cart", { product_id: product.id, quantity: qty });
    //     await this.load();
    //     return res.data;
    //   } catch (e) {
    //     throw e;
    //   }
    // },
    // async updateQty(id, qty) {
    //   try {
    //     await api.put(`/cart/${id}`, { quantity: qty });
    //     await this.load();
    //   } catch (e) {}
    // },
    // async remove(id) {
    //   try {
    //     await api.delete(`/cart/${id}`);
    //     await this.load();
    //   } catch (e) {}
    // },
    // clear() {
      this.items = [];
    },
    updateQty(id, qty) 
    { const found = this.items.find(i => i.id === id) 
      if (found && qty > 0) 
        { found.quantity = qty 
          this.save() 
        } 
      },
      removeItem(productId, userId = null) {
        this.items = this.items.filter(item => item.id !== productId);
        this.save(userId);
      },

    
    mergeGuestIntoUser(userId) {
      const guestKey = "cart_guest";
      const userKey = `cart_user_${userId}`;

      const guestCart = JSON.parse(localStorage.getItem(guestKey) || "[]");
      const userCart = JSON.parse(localStorage.getItem(userKey) || "[]");

      guestCart.forEach(gItem => {
        const found = userCart.find(u => u.id === gItem.id);
        if (found) {
          found.quantity += gItem.quantity;
        } else {
          userCart.push(gItem);
        }
      });
      

      localStorage.setItem(userKey, JSON.stringify(userCart));
      localStorage.removeItem(guestKey);

      this.items = userCart;
    },
  },
});

