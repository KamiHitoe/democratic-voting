<template>
  <button v-if="comment" class="comment" @click="reportComment">通報</button>
  <button v-else-if="topics" class="topics" @click="reportTopic">通報</button>
</template>

<script lang="ts">
import Vue, { PropType } from 'vue';
import { User, Topic, Comment } from "@/types";

export default Vue.extend({
  props: {
    user: { type: Object as PropType<User> },
    topics: { type: Object as PropType<Topic> },
    comment: { type: Object as PropType<Comment> },
  },
  methods: {
    async reportTopic() {
      await this.$axios.post("/report-topics", {
        user_id: this.user.id,
        topic_id: this.topics.id,
      })
      const res = await this.$axios.get("/report-topics", {
        params: {
          topic_id: this.topics.id,
        },
      })
      const reportNum = res.data.report_num;
      console.log(reportNum);
      // 通報数が5以上かつ投票数の1/10以上の時に当該トピックを削除
      if (reportNum > 5 && reportNum/this.topics.voted_num > 0.1) {
        this.$axios.delete(`/topics/${this.topics.id}`)
      }
    },
    async reportComment() {
      await this.$axios.post("/report-comments", {
        user_id: this.user.id,
        comment_id: this.comment.id,
      })
      const res = await this.$axios.get("/report-comments", {
        params: {
          comment_id: this.comment.id,
        },
      })
      const reportNum = res.data;
      console.log(reportNum);
      // 通報数が5以上かついいね数の1/10以上の時に当該コメントを削除
      if (reportNum > 5) {
        this.$axios.delete(`/comments/${this.comment.id}`)
      }
    },

  }
})
</script>

<style lang="scss">
.topics {
  max-height: 24px;
}
.comment {
  max-height: 18px;
}
</style>