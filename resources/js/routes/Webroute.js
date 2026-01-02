
import LayoutWeb from "@/views/web/layout/Layout.vue";
import Shop from "@/views/web/shop.vue"
import ShopDetail from '@/views/web/shopdetail.vue';
import Checkout from '@/views/web/Checkout.vue';

export default [
    {
        path: "/",
        component: LayoutWeb,
        children: [
        { path: "", component: Shop },
        { path: "shop/:slug", component: ShopDetail },
        { path: "checkout", component: Checkout,  meta: { requiresAuth: true } }
        ]
    },
    
]


