<template>
  <main>
    <h3>show topics below</h3>
    <div v-for="(topic, i) in topics" :key="i">
      <p>{{ topic }}</p>
    </div>
  </main>
</template>

<script lang="ts">
import Vue from 'vue'
// import axios from 'axios'

export default Vue.extend({
  data() {
    return {
      topics: [],
      errors: [],
    }
  },
  created() {
    this.$axios.get('/topics')
    .then(res => {
      console.log(res.data);
      this.topics = res.data;
    })
    .catch((e) => {
      this.errors.push(e);
      console.log(this.errors);
    })
  }
})
</script>

<style lang="scss" scoped>


</style>
