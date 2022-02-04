<template>
  <main>
    <TopicContents
      :topics="topics"
      :voted_status="voted_status"
    />

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
      <CommentBox :topic_id="topics.id" />
    </section>

    <RelatedTopics />
    <CategorySection />
  </main>
</template>

<script>
import Vue from 'vue'
import CategorySection from "@/components/CategorySection.vue";
import Comments from "@/components/Comments.vue";
import CommentBox from "@/components/CommentBox.vue";
import RelatedTopics from "@/components/RelatedTopics.vue";
import TopicContents from "@/components/TopicContents.vue";

export default {
  components: {
    CategorySection,
    Comments,
    CommentBox,
    RelatedTopics,
    TopicContents,
  },
  data() {
    return {
      topic_id: this.$route.params.id,
      topics: {
        category_id: 0,
      },
      commentList: [],
      user: { id: 1 },
      voted_status: false,
    };
  },
  async created() {
    await this.getTopics();
    await this.getComments();
    await this.getVotedStatus();
  },
  methods: {
    async getVotedStatus() {
      const res = await this.$axios.get(
        `/votes/${this.user.id}/${this.topics.id}`
      );
      this.voted_status = res.data.voted_status;
      console.log(this.voted_status);
    },
    async getTopics() {
      const res = await this.$axios.get(`/topics/${this.topic_id}`);
      this.topics = res.data;
      console.log(this.topics);
    },
    async getComments() {
      const res = await this.$axios.get(`/topics/${this.topic_id}/comments`);
      this.commentList = res.data;
      console.log(res.data);
    },
  },
};
</script>

<style lang="scss" scoped>
.subtitle {
  text-align: left;
}
.comment-subtitle {
  color: $amber;
}
.comment-contents {
  margin-top: 2rem;
  background-color: #fff;
  padding: 1rem;
}
</style>
