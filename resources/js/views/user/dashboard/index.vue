<template>
  <div class="w-full p-4">
    <!-- Dashboard Cards -->
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 md:grid-cols-4">
      <div
        v-for="(value, key) in counter"
        :key="key"
      >
        <DashboardCard
          :title="value.title"
          :count="value.count"
        />
      </div>
    </div>

    <!-- Graph Card -->
    <div class="mt-6">
      <div
        class="rounded-lg bg-white p-6 shadow-lg dark:bg-gray-900"
      >
        <h2 class="mb-4 text-xl font-semibold text-gray-800 dark:text-gray-100">
          Sales Overview
        </h2>

        <!-- Chart Placeholder -->
        <!-- <LineChart :chart-data="chartData" /> -->
      </div>
    </div>
  </div>
</template>

<script>
import api from '@/plugins/axios';
import DashboardCard from './DashboardCard.vue';
// import LineChart from './LineChart.vue';

export default {
  name: 'AuctionDashboard',
  components: {
    DashboardCard,
    // LineChart,
  },
  data() {
    return {
      counter: {
        customers: {
          title: 'Customers',
          count: 100,
        },
        products: {
          title: 'Inventory',
          count: 100,
        },
        invoices: {
          title: 'Expense',
          count: 100,
        },
        category: {
          title: 'Category',
          count: 100,
        },
      },
      chartData: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [
          {
            label: 'Sales',
            data: [100, 200, 300, 400, 500, 600],
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1,
          },
        ],
      },
    };
  },
};
</script>