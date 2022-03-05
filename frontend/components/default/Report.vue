<template>
  <button v-if="comment" class="report-comment" @click="reportComment">通報</button>
  <button v-else-if="topic" class="report-topic" @click="reportTopic">通報</button>
</template>

<script lang="ts">
import Vue, { PropType } from 'vue';
import mixins from "vue-typed-mixins";
import global from "@/mixins";
import { User, Topic, Comment } from "@/types";

export default mixins(global).extend({
  props: {
    user: { type: Object as PropType<User> },
    topic: { type: Object as PropType<Topic> },
    comment: { type: Object as PropType<Comment> },
  },
  mixins: [
    global,
  ],
  methods: {
    async reportTopic() {
      const agreement = confirm('このトピックを通報してよろしいですか？')
      if (agreement) {
        if (this.user.uid) {
          // 登録済ユーザのみ投票可能
          const params = {
            user_id: this.user.id,
            topic_id: this.topic.id,
          }
          const res_status = await this.$axios.get("/report/topics", {
            params: params,
          })
          const reported_status = res_status.data.reported_status
          if (reported_status === false) {
            // まだ通報していないユーザのみ通報を許可
            await this.$axios.post("/report/topics", params)
            const res_count = await this.$axios.get("/report/topics/count", {
              params: {
                topic_id: this.topic.id,
              },
            })
            alert('通報を受付ました')
            const reported_num = res_count.data.reported_num;
            console.log(reported_num);
            // 通報数が5以上かつ投票数の1/10以上の時に当該トピックを削除
            if (reported_num > 5 && reported_num/this.topic.voted_num > 0.1) {
              this.$axios.delete(`/topics/${this.topic.id}`)
            }
          } else {
            console.log('this user already reported')
            alert('すでに通報しています')
          }
        } else {
          this.updateShowModal();
        }
      }
    },
    async reportComment() {
      const agreement = confirm('このコメントを通報してよろしいですか？')
      if (agreement) {
        if (this.user.uid) {
          // 登録済ユーザのみ投票可能
          const params = {
            user_id: this.user.id,
            comment_id: this.comment.id,
          }
          const res_status = await this.$axios.get("/report/comments", {
            params: params,
          })
          const reported_status = res_status.data.reported_status
          if (reported_status === false) {
            // まだ通報していないユーザのみ通報を許可
            await this.$axios.post("/report/comments", params)
            const res_count = await this.$axios.get("/report/comments/count", {
              params: {
                comment_id: this.comment.id,
              },
            })
            alert('通報を受付ました')
            const reported_num = res_count.data.reported_num;
            console.log(reported_num);
            // 通報数が5以上かついいね数の1/10以上の時に当該コメントを削除
            const res_liked = await this.$axios.get("/likes/count", {
              params: {
                comment_id: this.comment.id,
              },
            })
            const liked_num = res_liked.data.liked_num
            if (reported_num > 5 && reported_num/liked_num > 0.1) {
              this.$axios.delete(`/comments/${this.comment.id}`)
            }
          } else {
            console.log('this user already reported')
            alert('すでに通報しています')
          }
        } else {
          this.updateShowModal();
        }
      }
    },

  }
})
</script>

<style lang="scss">
.report-topic {
  max-height: 24px;
  color: $gray;
  font-size: 12px;
}
.report-comment {
  max-height: 18px;
  color: $gray;
  font-size: 10px;
}
</style>