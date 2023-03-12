<template>
    <table class="transition" >
      <thead>
        <tr>
          <th></th>
          <th v-for="grade in grades" :key="grade.id">{{ grade.name }}</th>
          <th v-if="isEditing">
            <td><BaseButton>New Grade</BaseButton></td>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="objective in objectives" :key="objective.id">
          <td>{{ objective.name }}</td>
          <td v-for="grade in grades" :key="grade.id">
            <div v-if="rubric.outcomes[objective.id] && rubric.outcomes[objective.id][grade.id]">
              <label class="transition" v-if="!isEditing">
              <input class="transition"  v-if="isMarking" type="radio"
                     :name="'objective-' + objective.id"
                     :value="grade.id"
                     v-model="selectedOutcomes[objective.id]">
                     {{ rubric.outcomes[objective.id][grade.id].outcome }}
              </label>
              <input class="dark:bg-gray-600" v-else type="text" :value=" rubric.outcomes[objective.id][grade.id].outcome" @change="emits('updateOutcome', objective.id, grade.id, $event.target.value)" />
              <div class="description">
                <textarea class="dark:bg-gray-600 w-full focus:border-none" v-if="isEditing" :value="rubric.outcomes[objective.id][grade.id].description" @change="emits('updateOutcomeDesc', objective.id, grade.id, $event.target.value)"/>
                <p v-else>{{ rubric.outcomes[objective.id][grade.id].description }}</p>
                </div>
            </div>
          </td>
        </tr>
        <tr v-if="isEditing">
          <td><BaseButton @click=newObjective>New Objective </BaseButton></td>
        </tr>

      </tbody>
      <template v-if="isMarking">
        Total: {{ totalScore }} / {{ rubric.grades.at(-1).id * rubric.objectives.length }}
      </template>
      
    </table>
  </template>

<script setup>
    let selectedOutcomes = useState(()=> {return {}})
    let props = defineProps({rubric: {
      type: Object,
      required: true
    },
    isMarking: {
      type: Boolean,
      default: false
    },
    isEditing: {
      type: Boolean,
      default: false
    }
    })

    let emits = defineEmits(['updateObjectives', 'updateGrades', 'updateOutcome', 'updateOutcomeDesc'])

    let objectives = computed({get() {
      return props.rubric.objectives
    }, set(newObjectives){
      emits('updateObjectives', newObjectives)
    }})

    let grades = computed({get() {
      return props.rubric.grades
    }, set(newGrades){
      emits('updateGrades', newGrades)
    }})

    let totalScore = computed(()=> {
      return (Object.keys(selectedOutcomes.value).length == 0 ? 0 : Object.values(selectedOutcomes.value).reduce((a, b) => a + b))
    })
</script>

<style>
.description {
  font-style: italic;
  font-size: 0.8em;
}
</style>