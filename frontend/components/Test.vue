<template>
  <main>
    <button>test button</button>
    <p>{{ message }}</p>
  </main>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      // message: null,
    }
  },
  props: {
    message: String,
  },
})
</script>
