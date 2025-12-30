
import LayoutWeb from "@/views/web/layout/Layout.vue";
import Shop from "@/views/web/shop.vue"
import ShopDetail from '@/views/web/shopdetail.vue';

export default [
    {
        path: "/",
        component: LayoutWeb,
        children: [
        { path: "", component: Shop },
        { path: "shop/:slug", component: ShopDetail }
        ]
    },
]


