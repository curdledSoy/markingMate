<template>
  <tr>
    <th
      v-for="(column, index) in columns"
      :key="index"
      @click="sort(column.field)"
    >
      <slot :name="`header-${column.field}`">{{ column.label }}</slot>
      <span v-if="sortColumn === column.field">
        {{ sortDir === "asc" ? "▲" : "▼" }}
      </span>
    </th>
  </tr>
</template>

<script setup>
defineProps({
  columns: {
    type: Array,
    required: true,
  },
  sortColumn: {
    type: String,
    default: "",
  },
  sortDir: {
    type: String,
    default: "asc",
    validator: (value) => {
      return ["asc", "desc"].includes(value);
    },
  },
});
let emit = defineEmits(["sort"]);
const sort = (column) => {
  emit("sort", column);
};
</script>
