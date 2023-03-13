<template>
    <div>
        <main>
            <BaseTable  :data="{rows:[{id:1,name:'Compsci331', year: 2023, desc: 'Large Scale Software Development'}, {id:2,name:'Compsci339', year: 2024, desc: 'Capstone'}], columns: [{label:'ID', field:'id'},{label:'Name', field:'name'},{label:'Year', field:'year'},{label:'Description', field:'desc'},]}"/>
        </main>
    </div>
    
</template>