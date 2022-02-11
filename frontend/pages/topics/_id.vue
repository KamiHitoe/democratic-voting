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

      <div
        v-if="
          (!topics.sex || topics.sex == user.sex) &&
          (!topics.age || topics.age == user.age)
        "
      >
        <CommentBox :topic_id="topics.id" />
      </div>
      <p v-else class="invalid-user">
        ※この投稿の対象ユーザーではないためコメントできません。
      </p>
    </section>

    <RelatedTopics />
    <CategorySection />
  </main>
</template>

<script lang="ts">
import Vue from "vue";
import firebase from "@/plugins/firebase"
import CategorySection from "@/components/CategorySection.vue";
import Comments from "@/components/comments/Comments.vue";
import CommentBox from "@/components/comments/CommentBox.vue";
import RelatedTopics from "@/components/topics/RelatedTopics.vue";
import TopicContents from "@/components/topics/TopicContents.vue";
import { User, Topic, Comment } from "@/types"
import { initialUser } from "@/data";

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
      topic_id: this.$route.params.id as Number,
      topics: {
        category_id: 0,
      } as Topic,
      commentList: [] as Comment[],
      user: initialUser as User,
      voted_status: false as Boolean,
    };
  },
  async created() {
    await this.getUser();
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
          topic_id: this.topics.id,
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
      this.topics = res.data;
      console.log(this.topics);
    },
    async getComments() {
      const res = await this.$axios.get(`/topics/${this.topic_id}/comments`);
      this.commentList = res.data;
      console.log(res.data);
    },
    async getUser() {
      firebase.auth().onAuthStateChanged((user) => {
        if (user) {
          const uid = user.uid;
          this.$axios.get(`/users?uid=${uid}`)
          .then((res) => {
            if (res.data) {
              this.user = res.data
              console.log(this.user)
            } else {
              // uid未登録の場合
              console.log('uid is not registered')
            }
          })
        } else {
          // firebase Authに登録されていない場合
          console.log('user is not registered')
        }
      })
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
