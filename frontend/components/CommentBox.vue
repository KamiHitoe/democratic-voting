<template>
  <section>
    <h4 class="subtitle">コメントを投稿する</h4>
    <v-textarea
      outlined
      name="comment-box"
      placeholder="コメントを投稿してみよう！"
    >
    </v-textarea>
    <v-btn class="post-comment" color="amber" to="#" dark>コメントを投稿する</v-btn>

  </section>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
    }
  },
})
</script>

<style lang="scss" scoped>
section {
  text-align: center;
  margin-top: 1rem;
  .subtitle {
    text-align: left;
    color: $amber;
  }
  .post-comment {
    margin-bottom: 0.3rem;
  }
}
</style>
