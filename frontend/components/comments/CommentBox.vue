<template>
  <section id="comment-box">
    <div v-if="$store.state.parent_id">
      <h4 class="subtitle">コメントを投稿する</h4>
      <h4 class="text-header">{{ text_header }}</h4>
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
    </div>
    <div v-else>
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
    </div>



  </section>
</template>

<script lang="ts">
import Vue, { PropType } from "vue";
import { User, Comment } from "@/types";

export default Vue.extend({
  props: {
    user: { type: Object as PropType<User> },
    topic_id: { type: Number },
  },
  data() {
    return {
      parent_id: this.$store.state.parent_id as number,
      text_header: null as string,
      text: null as string,
    };
  },
  updated() {
    this.getParentId()
  },
  methods: {
    async submitComment() {
      let comment: Comment;
      if (this.parent_id) {
        comment = {
          user_id: this.user.id,
          text: `${this.text_header}\n${this.text}`,
          parent_id: this.parent_id,
        }
      } else {
        comment = {
          user_id: this.user.id,
          text: this.text,
          parent_id: this.parent_id,
        }
      }
      await this.$axios.post(`/topics/${this.topic_id}/comments`, comment);
      // alert('post comment success!');
      window.location.reload();
    },
    getParentId() {
      this.parent_id = this.$store.state.parent_id;
      this.text_header = `>> ${this.$store.state.parent_id}`
      console.log(this.parent_id);
    },
  },
});
</script>

<style lang="scss" scoped>
section {
  text-align: center;
  margin-top: 1rem;
  .post-comment {
    margin-bottom: 0.3rem;
  }
  .text-header {
    text-align: left;
    color: $amber;
    margin-bottom: 0;
  }
}
</style>
