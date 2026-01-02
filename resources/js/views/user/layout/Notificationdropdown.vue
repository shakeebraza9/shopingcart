<template>
  <div class="relative">
    <!-- Bell Button -->
    <button
      @click="open = !open"
      class="relative rounded-full p-2 hover:bg-gray-100 dark:hover:bg-gray-800"
    >
      <i class="mdi mdi-bell-outline text-xl"></i>
    </button>

    <!-- Dropdown -->
    <div
      v-if="open"
      @click.stop
      class="absolute right-0 z-30 mt-2 w-[352px] rounded-lg border bg-white shadow-lg
             animate-fade-in dark:border-gray-700 dark:bg-gray-900"
    >
      <!-- Header -->
      <div class="flex items-center justify-between border-b px-4 py-3">
        <h3 class="text-lg font-semibold">Notifications</h3>

        <div class="flex items-center gap-2">
          <span
            class="rounded-sm bg-blue-600 px-2 py-0.5 text-xs font-light text-white lowercase"
          >
            8 new
          </span>
          <span class="material-symbols-outlined text-lg">
            drafts
          </span>
        </div>
      </div>

      <!-- List -->
      <ul>
        <li
          v-for="(note, i) in notifications"
          :key="i"
          class="cursor-pointer transition hover:bg-gray-50 dark:hover:bg-gray-800"
        >
          <div class="flex items-start gap-3 px-4 py-3">
            <!-- Icon -->
            <div class="flex h-10 w-10 items-center justify-center rounded-full bg-blue-50">
              <i class="mdi mdi-bell-ring text-blue-600 text-sm"></i>
            </div>

            <!-- Content -->
            <div class="flex-1">
              <p class="text-sm font-medium">{{ note.title }}</p>
              <p class="text-sm text-gray-600 dark:text-gray-400">
                {{ note.description }}
              </p>
              <p class="mt-1 text-xs text-gray-500">
                {{ note.time }}
              </p>
            </div>

            <!-- Dot -->
            <div class="mt-2 h-2 w-2 rounded-full bg-blue-600"></div>
          </div>
        </li>
      </ul>

      <!-- Footer -->
      <div class="border-t px-4 py-3">
        <button
          class="w-full rounded bg-blue-600 py-2 text-sm text-white hover:bg-blue-700"
        >
          View All Notifications
        </button>
      </div>
    </div>
  </div>
</template>


<script>

export default {
    name: "NotificationMenu",
    data() {
        return {
            notifications: [
                {
                    title: "New Message",
                    description: "You have received a new message.",
                    time: "2m ago",
                },
                {
                    title: "Server Alert",
                    description: "Server CPU usage is high.",
                    time: "10m ago",
                },
                {
                    title: "Payment Received",
                    description: "Payment of $100 has been completed.",
                    time: "1h ago",
                },
            ],
        };
    },
};
</script>


