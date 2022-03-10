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
        <CommentBox :user="user" :topic_id="topic.id" />
      </div>
      <p v-else class="invalid-user">
        ※この投稿の対象ユーザーではないためコメントできません。
      </p>

    </section>

    <RelatedTopics :topic="topic"/>
    <CategorySection />
  </main>
</template>

<script lang="ts">
import Vue from "vue";
import mixins from "vue-typed-mixins";
import CategorySection from "@/components/CategorySection.vue";
import Comments from "@/components/comments/Comments.vue";
import CommentBox from "@/components/comments/CommentBox.vue";
import RelatedTopics from "@/components/topics/RelatedTopics.vue";
import TopicContents from "@/components/topics/TopicContents.vue";
import getUser from "@/mixins/getUser"
import { User, Topic, Comment } from "@/types"

export default mixins(getUser).extend({
  components: {
    CategorySection,
    Comments,
    CommentBox,
    RelatedTopics,
    TopicContents,
  },
  mixins: [
    getUser,
  ],
  data() {
    return {
      topic_id: this.$route.params.id as Number,
      topic: {
        category_id: 0,
      } as Topic,
      commentList: [] as Comment[],
      voted_status: false as Boolean,
      page: 1 as number,
      limit: 50 as number,
    };
  },
  async created() {
    await this.getUser();
    await setTimeout(() => console.log('wait'), 1000);
    await this.getTopics();
    await this.getComments();
    await this.getVotedStatus();
    console.log(
      `voted_status: ${this.voted_status} ${this.$store.state.voted_status}`
    );
  },
  methods: {
    async getVotedStatus() {
      const res = await this.$axios.get("/votes", {
        params: {
          user_id: this.user.id,
          topic_id: this.topic.id,
        },
      });
      if (res.data.voted_status) {
        this.$store.commit("updateVotedStatus", true);
        console.log(this.$store.state.voted_status);
      } else {
        this.$store.commit("updateVotedStatus", false);
      }
    },
    async getTopics() {
      const res = await this.$axios.get(`/topics/${this.topic_id}`);
      this.topic = res.data;
      console.log(this.topic);
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
.comment-contents {
  margin-top: 2rem;
  background-color: #fff;
  padding: 1rem;
}
.pagination {
  padding-top: 1rem;
}
</style>
