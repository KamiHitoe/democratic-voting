<template>
  <section>
    <button id="show-modal" @click="updateShowModal">Show Modal</button>

  </section>
</template>

<script lang="ts">
import Vue from "vue";
import global from "@/mixins";

export default Vue.extend({
  mixins: [
    global
  ],
  data() {
    return {
    };
  },
  async created() {
    await this.getUser();
    console.log(this.user);
  },
  methods: {
  },
});
</script>

<style lang="scss" scoped>

</style>
