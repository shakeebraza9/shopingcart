import { defineStore } from "pinia"
import axios from 'axios'
export const useCartStore = defineStore("cart", {
  state: () => ({
    items: [],
    drawerOpen: false,  
  }),

  actions: {
    async logOut() {
      try {
        await axios.post('/api/logout', {}, {
          headers: {
            Authorization: `Bearer ${this.token}`
          }
        })
      } catch (err) {
        console.error('Logout API error:', err)
      } finally {
        this.user = null
        this.is_logged_in = false
        this.token = null
        localStorage.removeItem('token')
      }
    },
    load() {
      const saved = localStorage.getItem("cart")
      this.items = saved ? JSON.parse(saved) : []
    },

    save() {
      localStorage.setItem("cart", JSON.stringify(this.items))
    },

    isInCart(id) {
      return this.items.some(i => i.id === id)
    },

    addToCart(product) {
      const existing = this.items.find(i => i.id === product.id)

      if (existing) {
        existing.quantity += product.quantity
      } else {
        this.items.push(product)
      }

      this.save()
      this.drawerOpen = true 
    },

    removeItem(id) {
      this.items = this.items.filter(i => i.id !== id)
      this.save()
    },

    updateQty(id, qty) {
      const item = this.items.find(i => i.id === id)
      if (item) item.quantity = qty
      this.save()
    },

    itemTotal(item) {
      return Number(item.price) * Number(item.quantity)
    }
  }
})
