<template>
    <div>
        <main>
            <CourseTable :cols="['id', 'name', 'year', 'desc']" :rows="[{id:1,name:'Compsci331', year: 2023, desc: 'Large Scale Software Development'},]"/>
        </main>
    </div>
    
</template>