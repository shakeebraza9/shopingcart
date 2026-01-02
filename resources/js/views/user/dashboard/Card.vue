<template>
  <div class="mb-6 bg-white rounded-2xl border border-gray-200 shadow-sm">

    <!-- Card Header -->
    <div class="flex items-center justify-between px-6 py-4 border-b">
      <h2 class="text-lg font-semibold text-gray-900">
        Online Auction
      </h2>

      <!-- Desktop Select -->
      <div class="hidden sm:block">
        <select
          v-model="onlineAction.platformsId"
          class="w-[200px] rounded-lg border-gray-300 text-sm
                 focus:ring-[#C2A875] focus:border-[#C2A875]"
        >
          <option disabled value="">Select Platform</option>
          <option v-for="p in onlineAction.data" :key="p.auction_platform_name" :value="p.id">
            {{ p.auction_platform_name }}
          </option>
        </select>
      </div>
    </div>

    <!-- Card Body -->
    <div class="p-6">

      <!-- Mobile Select -->
      <div class="sm:hidden mb-4">
        <select
          v-model="onlineAction.platformsId"
          class="w-full rounded-lg border-gray-300 text-sm
                 focus:ring-[#C2A875] focus:border-[#C2A875]"
        >
          <option disabled value="">Select Platform</option>
          <option v-for="p in onlineAction.data" :key="p.auction_platform_name" :value="p.id">
            {{ p.auction_platform_name }}
          </option>
        </select>
      </div>

      <!-- Table -->
      <div class="overflow-x-auto">
        <table class="min-w-full border border-gray-200 rounded-lg overflow-hidden">
          <thead class="bg-gray-50">
            <tr class="text-sm text-gray-600">
              <th class="px-4 py-3 text-left">Platform</th>
              <th class="px-4 py-3 text-left">Type of Auction</th>
              <th class="px-4 py-3 text-left">Total Auction</th>
              <th class="px-4 py-3 text-left">Remaining</th>
              <th class="px-4 py-3 text-left">Lots</th>
            </tr>
          </thead>

          <tbody class="divide-y">

            <!-- Loading -->
            <tr v-if="onlineAction.isLoadingOnline">
              <td colspan="5" class="px-4 py-6">
                <div class="h-2 w-full bg-gray-200 rounded-full overflow-hidden">
                  <div class="h-full w-1/2 bg-[#C2A875] animate-pulse"></div>
                </div>
              </td>
            </tr>

            <!-- Data -->
            <tr
              v-else-if="onlineAction.data.length"
              v-for="item in onlineAction.data"
              :key="item.auction_platform_name"
              class="text-sm text-gray-700 hover:bg-gray-50 transition"
            >
              <td class="px-4 py-3 font-medium">
                {{ item.auction_platform_name }}
              </td>
              <td class="px-4 py-3">
                {{ item.auction_type }}
              </td>
              <td class="px-4 py-3">
                {{ item.car_count }}
              </td>
              <td class="px-4 py-3">
                {{ item.remaining }}
              </td>
              <td class="px-4 py-3">
                {{ item.lots }}
              </td>
            </tr>

            <!-- Empty -->
            <tr v-else>
              <td colspan="5" class="px-4 py-8 text-center text-gray-400 text-sm">
                No data found
              </td>
            </tr>

          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>




<script>



export default {
    name: 'AuctionDashboard',

    data() {
        return {
            onlineAction: {
                isLoadingOnline: false,
                platformsId: null,
                data: [],
            },
        }
    },
    computed: {

    },
    mounted() {

    },
    methods: {



    },






}
</script>