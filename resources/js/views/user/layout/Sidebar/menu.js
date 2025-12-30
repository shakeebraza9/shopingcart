export default [
       
        {
            icon: "mdi-view-dashboard-outline",
            label: "Dashboard",
            path: "/admin/dashboard",
        },
        {
            icon: "mdi-account-multiple",
            label: "Inventory",
            path: "/",
            children:[
                {
              
                    label: "Product List",
                    path: "/admin/product",
                },
                {
            
                    label: "Order List",
                    path: "/admin/order",
                },

            ]
        },
      
    ];