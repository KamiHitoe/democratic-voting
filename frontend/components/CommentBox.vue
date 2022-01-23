<template>
  <section>
    <h4 class="subtitle">コメントを投稿する</h4>
    <v-textarea
      v-model="text"
      outlined
      color="amber"
      name="comment-box"
      placeholder="コメントを投稿してみよう！"
    >
    </v-textarea>
    <v-btn
      class="post-comment"
      color="amber"
      dark
      @click="submitComment"
      >コメントを投稿する</v-btn>

  </section>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      text: null,
      parent_id: null,
    }
  },
  props: {
    topic_id: Number,
  },
  methods: {
    async submitComment() {
      await this.$axios.post(`/topics/${this.topic_id}/comments`, {
        user_id: 1,
        text: this.text,
        parent_id: this.parent_id,
      })
      // alert('post comment success!');
      window.location.reload();
    }
  },
})
</script>

<style lang="scss" scoped>
section {
  text-align: center;
  margin-top: 1rem;
  .subtitle {
    @extend %subtitle;
  }
  .post-comment {
    margin-bottom: 0.3rem;
  }
}
</style>
