<template>
    <tr>
    <slot :row="row" name="row">
        
        <td v-for="data in row">{{ data }}</td>
    
    </slot>
</tr>
    
</template>

<script setup>
defineProps(['row'])
</script>