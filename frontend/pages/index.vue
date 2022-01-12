<template>
  <main>
    <h1>This is WeWorld home page</h1>
    <img src="https://images-na.ssl-images-amazon.com/images/I/61jxhHI6a9L.jpg">
    <p>we want to connect with each other. It's time to connect with all over the world</p>
    <v-btn class="deep-purple" to="/test" dark>jump to test</v-btn>

  </main>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  name: 'IndexPage',
  data() {
    return {
      msg: 'foo',
    }
  },
})
</script>

<style lang="scss" scoped>
main {
  text-align: center;
}
img {
  max-height: 30rem;
  padding: 30px 0;
}
</style>
