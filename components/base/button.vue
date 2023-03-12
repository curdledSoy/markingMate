<template>
  <button
    class="py-2 px-4 rounded-md disabled:cursor-not-allowed"
    :class="config[color]"
  >
    <slot />
  </button>
</template>

<script setup>
let props = defineProps({
  config: {
    type: Object,
    default: {
      primary: ["hover:bg-blue-500", "bg-blue-700", "disabled:bg-blue-700"],

      secondary: ["hover:bg-red-500", "bg-red-700", "disabled:bg-red-700"],
      tertiary: [
        "hover:bg-yellow-500",
        "bg-yellow-700",
        "disabled:bg-yellow-700",
      ],
    },
  },
  color: { type: String, default: "primary" },
});
</script>
