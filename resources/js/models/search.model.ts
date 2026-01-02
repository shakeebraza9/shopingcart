import api from "./general.model"

/* =======================
   Types
======================= */

export interface SearchResult {
  id: number
  title: string
  slug: string
  selling_price: number
  image?: string
}

export interface SearchResponse {
  data: SearchResult[]
  meta?: {
    page: number
    total: number
    has_more: boolean
  }
}

/* =======================
   API
======================= */

export default {
  /**
   * Full product search
   * (used on search results page)
   */
  search(params: {
    q: string
    page?: number
    limit?: number
  }) {
    return api.getAndfind<SearchResponse>(
      "/api/shop/search",
      { params }
    )
  },

  /**
   * Lightweight suggestions
   * (used in header search dropdown)
   */
  suggest(query: string, limit = 6) {
    return api.getAndfind<{ data: SearchResult[] }>(
      "/api/shop/search",
      {
        params: {
          q: query,
          limit
        }
      }
    )
  }
}
