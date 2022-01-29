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
    <v-btn class="post-comment" color="amber" dark @click="submitComment"
      >コメントを投稿する
    </v-btn>
  </section>
</template>

<script lang="ts">
import Vue, { PropType } from "vue";
import { Comment } from "@/types";

export default Vue.extend({
  props: {
    topic_id: { type: Number },
  },
  data() {
    return {
      text: null as string,
      parent_id: null as number,
    };
  },
  methods: {
    async submitComment() {
      let comment: Comment = {
        user_id: 1,
        text: this.text,
        parent_id: this.parent_id,
      }
      await this.$axios.post(`/topics/${this.topic_id}/comments`, comment);
      // alert('post comment success!');
      window.location.reload();
    },
  },
});
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
