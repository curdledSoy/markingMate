<template>
  <table :class="tableClass">
    <thead>
      <BaseTableHeader
        :columns="state.columns"
        :sortColumn="state.sortColumn"
        :sortDir="state.sortDir"
        @sort="sort"
      >
        <template
          v-for="(column, columnIndex) in state.columns"
          :key="columnIndex"
          v-slot:[`header-${column}`]
        >
          <slot :name="`header-${column}`">{{ column }}</slot>
        </template>
      </BaseTableHeader>
    </thead>
    <tbody>
      <BaseTableRow
        v-for="(row, rowIndex) in paginatedRows"
        :key="rowIndex"
        :row="row"
        :columns="state.columns"
      >
        <template
          v-for="(column, columnIndex) in state.columns"
          :key="columnIndex"
          v-slot:[`cell-${column}`]
        >
          <slot :name="`cell-${column}`" :row="row">{{ row[column] }}</slot>
        </template>
      </BaseTableRow>
    </tbody>
  </table>
</template>

<script setup>
let props = defineProps({
  data: {
    type: Object,
    required: true,
    validator: (value) => {
      return value.hasOwnProperty("rows") && value.hasOwnProperty("columns");
    },
  },
  filterKey: {
    type: String,
    default: "",
  },
  perPage: {
    type: Number,
    default: 10,
  },
  tableClass: {
    type: String,
    default: "table-auto",
  },
});

const state = reactive({
  columns: props.data.columns,
  rows: props.data.rows,
  currentPage: 1,
  sortColumn: "",
  sortDir: "asc",
});

const filteredRows = computed(() => {
  const filterKey = props.filterKey.toLowerCase();
  return state.rows.filter((row) => {
    return Object.values(row).some((value) =>
      String(value).toLowerCase().includes(filterKey)
    );
  });
});

const sortedRows = computed(() => {
  if (state.sortColumn) {
    return filteredRows.value.slice().sort((a, b) => {
      const col = state.sortColumn;
      const aVal = a[col];
      const bVal = b[col];
      if (aVal === bVal) {
        return 0;
      }
      if (state.sortDir === "asc") {
        return aVal < bVal ? -1 : 1;
      } else {
        return aVal > bVal ? -1 : 1;
      }
    });
  } else {
    return filteredRows.value;
  }
});

const pageCount = computed(() => {
  return Math.ceil(sortedRows.value.length / props.perPage);
});

const paginatedRows = computed(() => {
  const page = state.currentPage - 1;
  const perPage = props.perPage;
  const offset = page * perPage;
  return sortedRows.value.slice(offset, offset + perPage);
});


function sort(column) {
  if (column === state.sortColumn) {
    state.sortDir = state.sortDir === "asc" ? "desc" : "asc";
  } else {
    state.sortColumn = column;
    state.sortDir = "asc";
  }
}
</script>

