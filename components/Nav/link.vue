<template>
    <NuxtLink :to="to">
    <NavItem>
        <p>{{ text }}</p>
    </NavItem>
</NuxtLink>
</template>

<script setup>
let props = defineProps({
    'to': {type: String, default: '/'},
    'text': {type: String, default: 'Home'}, 
})
</script>


<style>
.router-link-active{
    @apply dark:bg-slate-500 bg-slate-400 hover:bg-slate-400
}
</style>