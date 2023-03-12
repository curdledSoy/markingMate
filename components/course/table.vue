<template>
  <ClientOnly>
    <BaseTable :rows="rows" :columns="cols">
      <template #data="{ rows }">
        <BaseTableRow :row="row" v-for="row in rows">
            <template #row>
          
            <td v-for="data in row"><NuxtLink :to="`/courses/${row.id}`">{{ data }}</NuxtLink></td>
        </template>
        </BaseTableRow>
      </template>
    </BaseTable>
  </ClientOnly>
</template>

<script setup>
defineProps(["rows", "cols"]);
</script>
