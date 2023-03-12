<template>
  <table class="table-auto">
    <slot :cols="columns" name="head"><BaseTableHead :cols="columns"  /></slot>
    <tbody>
      <slot :rows="rows" name="data"> <BaseTableRow v-for="row in rows" :row="row" /></slot>
    </tbody>
  </table>
</template>

<script setup>
defineProps(["rows", "columns"]);
</script>
