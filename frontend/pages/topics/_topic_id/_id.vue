<template>
  <main>
    <TopicContents :topics="topics" :user="user" />

    <section class="comment-contents">
      <h4 class="comment-subtitle">コメント</h4>
      <v-divider></v-divider>
      <Comments
        v-for="(comment, i) in commentList"
        :key="comment.id"
        :comment="comment"
        :topic_id="topics.id"
        :order="i + 1"
      />

      <div v-if="(!topics.sex || topics.sex == user.sex) && (!topics.age || topics.age == user.age)">
        <CommentBox :topic_id="topics.id" />
      </div>
      <p v-else class="invalid-user">※この投稿の対象ユーザーではないためコメントできません。</p>
    </section>

  </main>
</template>

<script>
import Vue from 'vue'
import CategorySection from "@/components/CategorySection.vue";
import Comments from "@/components/comments/Comments.vue";
import CommentBox from "@/components/comments/CommentBox.vue";
import RelatedTopics from "@/components/topics/RelatedTopics.vue";
import TopicContents from "@/components/topics/TopicContents.vue"
import { testUser } from "@/data/data"

export default Vue.extend({
  components: {
    CategorySection,
    Comments,
    CommentBox,
    RelatedTopics,
    Voting,
    TopicContents,
  },
  data() {
    return {
      topic_id: this.$route.params.topic_id,
      comment_id: this.$route.params.id,
      topics: {
        category_id: 0,
      },
      commentList: [],
      categoryList,
      user: testUser,
    };
  },
  async created() {
    await this.getTopics();
    await this.getRepliedComments();
  },
  methods: {
    async getTopics() {
      const res = await this.$axios.get(`/topics/${this.topic_id}`);
      this.topics = res.data;
      this.topic_id = this.topics.id
      console.log(this.topics);
    },
    async getRepliedComments() {
      const res = await this.$axios.get(`/comments/${this.topic_id}/${this.comment_id}`);
      this.commentList = res.data;
      console.log(res.data);
    },
  },
})
</script>

<style lang="scss" scoped>
.subtitle,
.topics-title,
.topics-description {
  text-align: left;
}
.change-color,
.comment-subtitle {
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
</style>
