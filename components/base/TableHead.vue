<template>
    <thead>
        <tr>
            <th v-for="col in cols">
                {{ col }}
            </th>
        </tr>
    </thead>
</template>


<script setup>
    defineProps(['cols'])
</script>