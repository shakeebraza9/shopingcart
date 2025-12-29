
import { createRouter, createWebHistory } from 'vue-router';
import { useUserStore } from '@stores/userStore';
import { useAlertStore } from '@stores/alertStore';




// Routes...
import LayoutWeb from "@/views/web/layout/Layout.vue";
import Shop from "@/views/web/shop.vue"
import ShopDetail from '@/views/web/shopdetail.vue';

import Layout from "@views/user/layout/index.vue";
import Login from '@/views/auth/login.vue';

import NotFound from "@views/user/404.vue"
import Dashboard from '@views/user/dashboard/index.vue';
import deliverynoteRoute from "@views/user/deliverynote/route"
import Forget  from '@/views/auth/forget.vue';



const suburl = import.meta.env.VITE_SUB_URL;

const routes = [

    {
        path: "/",
        component: LayoutWeb,
        children: [
        { path: "", component: Shop },
        { path: "shop/:slug", component: ShopDetail }
        ]
    },
    { path: '/login', component: Login},
    { path: '/forgetpassowrd',name: 'forgot-password', component: Forget},
    {
        path: "/admin",
        component: Layout,
        children: [
            { path: 'dashboard', component: Dashboard, meta: { requiresAuth: true } },
            // ...accountRoutes,
            // ...inventoryRoute,
            // ...categoryRoute,
            // ...expensecategoryRoute,
            // ...expenseRoute,
            // ...unitRoute,
            // ...reportRoute,
            // ...saleInvoiceRoute,
            // ...paymentsRoute,
            // ...stockadjustmentRoute,
            // ...saleorderRoute,
            // ...deliverynoteRoute,
        ],
    },
    {
        path: "/:pathMatch(.*)*",
        name: "NotFound",
        component: NotFound
    },
];

const router = createRouter({
    history: createWebHistory(suburl),
    routes,
});



router.beforeEach(async (to, from, next) => {


    const auth = useUserStore()
    const alertStore = useAlertStore()

    //Auth Restriction

        try {

            const res = await auth.getProfile();
            auth.user = res.user;
            auth.is_logged_in = true;
            
        } catch (error) {
            auth.user = {};
            auth.is_logged_in = false;
            localStorage.removeItem('auth_token');
        }
    
    
    if (to.meta.requiresAuth){
        if (auth.is_logged_in) {
            next()
        }else{
            next('/login');
        }

    } else {
        next()
    }



});

export default router;