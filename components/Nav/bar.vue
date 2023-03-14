<template>
  <nav
    class="dark:bg-slate-600 bg-slate-300 flex justify-evenly items-center p-2"
  >
    <NavLink
      v-for="item in config"
      :text="item.text"
      :to="item.to"
      :key="item.id"
    />
    <div
      class="flex right-0"
      :title="isDark ? 'Enable Light Mode' : 'Enable Dark Mode'"
    >
      <ClientOnly>
        <NavAction @click="toggleDark()">
          {{ isDark ? "🌞" : "🌕" }}
        </NavAction>
      </ClientOnly>

      <NavAction
        title="Sign Out"
        @click="signOut"
        v-if="status === 'authenticated'"
      >
        🚪
      </NavAction>
      <NavAction title="Sign in" v-else> 🧑 </NavAction>
    </div>
  </nav>
</template>

<script setup>
let config = [
  { id: 1, to: "/", text: "Home" },
  { id: 2, to: "/courses", text: "Courses" },
  { id: 3, to: "/marking", text: "Marking" },
  { id: 4, to: "/rubrics", text: "Rubrics" },
];
let isDark = useDark();
let toggleDark = useToggle(isDark);
let { status, signOut } = {status:'unauthenticated', signOut:function(){}};
</script>
