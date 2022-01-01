<template>
  <main>
    <h3>this is test page</h3>
    <NuxtLink class="jump" to="/">jump home</NuxtLink>
  </main>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  name: 'InspirePage',
  created() {
    this.showString("say hi");
  },
  methods: {
    showString(str: string) {
      console.log(str.toUpperCase());
    }
  },
})
</script>

<style lang="scss" scoped>
.jump {
  background: pink;
  &:hover {
    background: green;
  }
}

</style>
