import { defineStore } from 'pinia'
import searchApi from '@/models/search.model'

let debounceTimer = null

export const useSearchStore = defineStore('search', {
  state: () => ({
    query: '',
    suggestions: [],
    loadingSuggestions: false,
  }),

  actions: {
    setQuery(q) {
      this.query = q

      if (!q || q.length < 2) {
        this.clearSuggestions()
        return
      }

      clearTimeout(debounceTimer)
      debounceTimer = setTimeout(() => {
        this.fetchSuggestions()
      }, 300)
    },

    async fetchSuggestions() {
      this.loadingSuggestions = true
      try {
        const res = await searchApi.suggest(this.query, 6)
        this.suggestions = res.data.data || []
      } catch {
        this.suggestions = []
      } finally {
        this.loadingSuggestions = false
      }
    },

    clearSuggestions() {
      this.suggestions = []
      this.loadingSuggestions = false
    },

    clear() {
      this.query = ''
      this.clearSuggestions()
    }
  }
})
