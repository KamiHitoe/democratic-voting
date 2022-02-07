<template>
  <main>
    <TopicContents
      :topics="topics"
      :user="user"
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

      <div v-if="(!topics.sex || topics.sex == user.sex) && (!topics.age || topics.age == user.age)">
        <CommentBox :topic_id="topics.id" />
      </div>
      <p v-else class="invalid-user">※この投稿の対象ユーザーではないためコメントできません。</p>
    </section>

    <RelatedTopics />
    <CategorySection />
  </main>
</template>

<script>
import Vue from 'vue'
import CategorySection from "@/components/CategorySection.vue";
import Comments from "@/components/comments/Comments.vue";
import CommentBox from "@/components/comments/CommentBox.vue";
import RelatedTopics from "@/components/topics/RelatedTopics.vue";
import TopicContents from "@/components/topics/TopicContents.vue";
import { testUser } from "@/data"

export default Vue.extend({
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
      user: testUser,
      voted_status: false,
    };
  },
  async created() {
    await this.getTopics();
    await this.getComments();
    await this.getVotedStatus();
    console.log(`voted_status: ${this.voted_status} ${this.$store.state.voted_status}`)
  },
  methods: {
    async getVotedStatus() {
      const res = await this.$axios.get(
        `/votes/${this.user.id}/${this.topics.id}`
      );
      if (res.data.voted_status) {
        this.$store.commit('updateVotedStatus', true)
        console.log(this.$store.state.voted_status);
      } else {
        this.$store.commit('updateVotedStatus', false)
      }
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
});
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
