<template>
      <div>
        <h1 class="font-bold text-xl">{{ rubric.name }}</h1>
        <h1 class="font-semibold text-md">
          {{ rubric.course }}: {{ rubric.assessment }}
        </h1>
        <h1 class="font-thin text-sm">
          {{ rubric.semester }}, {{ rubric.year }}
        </h1>
        <div class="space-x-3">
          <template
            v-if="
              rubricState['isEditing'] == false &&
              rubricState['isMarking'] == false
            "
          >
            <BaseButton>Export</BaseButton>
            <BaseButton color="tertiary" @click="changeRubricState('isEditing')">Edit</BaseButton>
          </template>
          <template v-if="rubricState['isEditing'] || rubricState['isMarking']">
            <BaseButton color="tertiary"  @click="changeRubricState('isSaving')">Save</BaseButton>
            <BaseButton  color="secondary" @click="changeRubricState('isCancel')">Cancel</BaseButton>
            <BaseButton :disabled="!canUndo" @click="undo">Undo</BaseButton>
            <BaseButton :disabled="!canRedo" @click="redo">Redo</BaseButton>
          </template>
        </div>
      </div>
  
      <RubricView
        :isEditing="rubricState['isEditing']"
        :isMarking="rubricState['isMarking']"
        :rubric="rubric"
        @updateObjectives="updateObjectives"
        @updateGrades="updateGrades"
        @updateOutcomeDesc="updateOutcomeDesc"
        @updateOutcome="updateOutcome"
      />
  </template>
  
  <script setup>
  let rubric = ref({
    name: "Rubric",
    assessment: "Assignment 1",
    course: "COMPSCI331",
    semester: "Semester 1",
    year: 2023,
    grades: [
      { id: 1, name: "Fail" },
      { id: 2, name: "Pass" },
      { id: 3, name: "Credit" },
      { id: 4, name: "Distinction" },
      { id: 5, name: "High Distinction" },
    ],
    objectives: [
      { id: 1, name: "Objective 1" },
      { id: 2, name: "Objective 2" },
      { id: 3, name: "Objective 3" },
    ],
    outcomes: {
      1: {
        1: { outcome: "1F", description: "Fail description for Outcome 1" },
        2: { outcome: "1P", description: "Pass description for Outcome 1" },
        3: { outcome: "1C", description: "Credit description for Outcome 1" },
        4: {
          outcome: "1D",
          description: "Distinction description for Outcome 1",
        },
        5: {
          outcome: "1HD",
          description: "High Distinction description for Outcome 1",
        },
      },
      2: {
        1: { outcome: "2F", description: "Fail description for Outcome 2" },
        2: { outcome: "2P", description: "Pass description for Outcome 2" },
        3: { outcome: "2C", description: "Credit description for Outcome 2" },
        4: {
          outcome: "2D",
          description: "Distinction description for Outcome 2",
        },
        5: {
          outcome: "2HD",
          description: "High Distinction description for Outcome 2",
        },
      },
      3: {
        1: { outcome: "3F", description: "Fail description for Outcome 3" },
        2: { outcome: "3P", description: "Pass description for Outcome 3" },
        3: { outcome: "3C", description: "Credit description for Outcome 3" },
        4: {
          outcome: "3D",
          description: "Distinction description for Outcome 3",
        },
        5: {
          outcome: "3HD",
          description: "High Distinction description for Outcome 3",
        },
      },
    },
  });
  
  let {undo, redo, canUndo, canRedo, ...history} = useRefHistory(rubric, {deep:true})
  
  
  
  let rubricState = useState(() => {
    return {
      isEditing: false,
      isMarking: false,
      isSaving: false,
      isLoading: false,
      isCancel: false
    };
  });
  
  
  let changeRubricState = (toChange) => {
    if (toChange == "reset") {
      rubricState.value = {
        isEditing: false,
        isMarking: false,
        isSaving: false,
        isLoading: false,
      };
    } else {
      rubricState.value[toChange] = true;
      for (const key in Object.keys(rubricState.value)) {
        if (key != toChange) {
          rubricState.value[key] = false;
        }
      }
    }
  };
  
  watch(rubricState, (newState)=> {
      if (newState.isCancel || newState.isSaving ){
          history.clear()
          changeRubricState('reset')
      }
  }, 
  {deep:true})
  
  let updateGrades = (newGrades) => {
    rubric.value.grades = newGrades;
  };
  
  let updateObjectives = (newObj) => {
    rubric.value.objectives = newObj;
  };
  
  let updateOutcome = (objId, gradeId, data) => {
    rubric.value.outcomes[objId][gradeId].outcome = data;
  };
  
  let updateOutcomeDesc = (objId, gradeId, data) => {
    rubric.value.outcomes[objId][gradeId].description = data;
  };
  </script>
  