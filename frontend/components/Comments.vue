<template>
  <section>
    <h4 class="subtitle">コメント</h4>
    <v-divider></v-divider>
    <div class="contents">
      <div class="comments-info d-flex flex-row">
        <p class="data-margin">1</p>
        <p class="data-margin">名無しさん</p>
        <p class="data-margin">2022/01/18</p>
        <p class="ml-auto">＞返信</p>
      </div>
      <p class="data-margin">いやー、やっぱりマリア様がみてる一強か～　ごきげんよう</p>
      <div class="d-flex flex-row">
        <h4 class="topics-title">2件の返信</h4>
        <p class="ml-auto">いいね 3</p>
      </div>
    </div>
    <v-divider></v-divider>
  </section>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
    }
  },
  props: {
    topics: Object,
  }
})
</script>

<style lang="scss" scoped>
section {
  background-color: #fff;
  padding: 1rem;
  margin-top: 2rem;
}
.subtitle {
  color: #FFC107;
}
.contents {
  padding: 1rem;
  .comments-info {
    font-size: 12px;
  }
  .data-margin {
    margin-right: 0.5rem;
  }
}
</style>
