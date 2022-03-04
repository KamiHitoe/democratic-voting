<template>
  <section>
    <div>        
      <input type="file" id="fileUpload">    
    </div>    
    <div> 
      <button @click="s3upload">Submit</button>
    </div>
    <img src="https://test-democratic-img.s3.ap-northeast-1.amazonaws.com/chika01.jpg">

  </section>
</template>

<script lang="ts">
import Vue from "vue";
import global from "@/mixins";
import AWS from "aws-sdk";

export default Vue.extend({
  mixins: [
    global
  ],
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
