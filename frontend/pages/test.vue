<template>
  <section>  
    <div> 
      <button @click="foo">foo</button>
    </div>
    <img src="https://test-democratic-img.s3.ap-northeast-1.amazonaws.com/chika01.jpg">

  </section>
</template>

<script lang="ts">
import Vue from "vue";
import mixins from "vue-typed-mixins";

export default Vue.extend({
  mixins: [
    // topicsPage
  ],
  template: 'hey',
  data() {
    return {
    };
  },
  async created() {
  },
  methods: {
  },
});
</script>

<style lang="scss" scoped>

</style>
