<template>
  <main>
    <TopicContents :topic="topic" :user="user" />

    <section class="comment-contents">
      <h4 class="subtitle">コメント</h4>
      <v-divider></v-divider>
      <Comments
        v-for="(comment, i) in commentList.slice((page-1)*limit, page*limit)"
        :key="comment.id"
        :comment="comment"
        :topic_id="topic.id"
        :order="i+1 + (page-1)*limit"
        :user="user"
      />

      <v-pagination
        class="pagination"
        v-model="page"
        v-if="(commentList.length !== 0)"
        :length="Math.ceil(commentList.length / limit)"
        :total-visible="7"
        color="amber"
      ></v-pagination>

      <div
        v-if="
          (!topic.sex || topic.sex == user.sex) &&
          (!topic.age || topic.age == user.age)
        "
      >
        <CommentBox :topic_id="topic.id" />
      </div>
      <p v-else class="invalid-user">
        ※この投稿の対象ユーザーではないためコメントできません。
      </p>
    </section>
  </main>
</template>

<script lang="ts">
import Vue from "vue";
import Comments from "@/components/comments/Comments.vue";
import CommentBox from "@/components/comments/CommentBox.vue";
import TopicContents from "@/components/topics/TopicContents.vue";
import getUser from "@/mixins/getUser";
import { User, Topic, Comment } from "@/types"

export default Vue.extend({
  components: {
    Comments,
    CommentBox,
    TopicContents,
  },
  mixins: [
    getUser,
  ],
  data() {
    return {
      topic_id: this.$route.params.topic_id as Number,
      comment_id: this.$route.params.id as Number,
      topic: {
        category_id: 0,
      } as Topic,
      commentList: [] as Comment[],
      page: 1 as number,
      limit: 50 as number,
    };
  },
  async created() {
    // await this.getUser();
    await this.getTopics();
    await this.getRepliedComments();
  },
  methods: {
    async getTopics() {
      const res = await this.$axios.get(`/topics/${this.topic_id}`);
      this.topic = res.data;
      this.topic_id = this.topic.id;
      console.log(this.topic);
    },
    async getRepliedComments() {
      const resParent = await this.$axios.get(
        `/topics/${this.topic_id}/comments/${this.comment_id}`
      );
      const resReply = await this.$axios.get(
        `/comments/${this.topic_id}/${this.comment_id}`
      );
      this.commentList = resReply.data;
      this.commentList.unshift(resParent.data);
    },
  },
});
</script>

<style lang="scss" scoped>
.subtitle,
.topics-title,
.topics-description {
  text-align: left;
}
.change-color {
  color: $amber;
}
.vote-contents {
  padding: 1rem;
  background-color: #fff;
  text-align: center;
  .vote-body {
    margin-top: 1rem;
    color: $text;
  }
  .vote-btn,
  .voted-comment {
    margin: 1rem 0;
  }
}
.comment-contents {
  margin-top: 2rem;
  background-color: #fff;
  padding: 1rem;
}
.topics-img {
  width: 100px;
  height: 100px;
  margin-right: 3rem;
}
.data-margin {
  margin-right: 1rem;
}
.topics-description {
  margin: 2rem 0;
}
.pagination {
  padding-top: 1rem;
}
</style>
