<template>
    <tr>
      <td v-for="(column, index) in columns" :key="index">
        <slot :name="`cell-${column.field}`" :row="row">{{ row[column.field] }}</slot>
      </td>
    </tr>
  </template>
  
  <script>
  export default {
    props: {
      row: {
        type: Object,
        required: true,
      },
      columns: {
        type: Array,
        required: true,
      },
    },
  };
  </script>
  