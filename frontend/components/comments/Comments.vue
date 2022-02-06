<template>
  <section>
    <div class="contents">
      <div class="comment-info d-flex flex-row">
        <p class="data-margin">{{ order }}.</p>
        <p class="data-margin">名無しさん</p>
        <p class="data-margin">{{ comment.timestamp }}</p>
        <button class="reply-btn d-flex flex-row ml-auto" @click="reply">
          <v-icon color="amber">mdi-reply</v-icon>
          <p>返信</p>
        </button>
      </div>
      <p class="comment-text data-margin">{{ comment.text }}</p>
      <div class="d-flex flex-row">

        <ReplyList :topic_id="topic_id" :comment="comment" />
        <!-- <nuxt-link v-if="replyList.length" class="replied-messages d-flex flex-row" :to="`/topics/${topic_id}/${comment.id}`">
          <h5 class="reply_num">{{ replyList.length }} 件の返信</h5>
          <v-icon color="white" small>mdi-message</v-icon>
        </nuxt-link>
        <p v-else></p> -->

        <Like :user="user" :comment="comment" />

      </div>
    </div>

    <v-divider></v-divider>
  </section>
</template>

<script lang="ts">
import Vue, { PropType } from "vue";
import { User, Comment } from "@/types";
import Like from "@/components/comments/Like.vue";
import ReplyList from "@/components/comments/ReplyList.vue";

export default Vue.extend({
  props: {
    comment: { type: Object as PropType<Comment> },
    order: { type: Number },
    topic_id: { type: Number },
  },
  components: {
    Like,
    ReplyList,
  },
  data() {
    return {
      user: {
        id: 1,
        username: 'hitoe',
        sex: '男性',
        age: 20,
      } as User,
      // replyList: [] as Comment[],
    };
  },
  // created() {
  //   this.getReplyList();
  // },
  methods: {
    async getReplyList() {
      const res = await this.$axios.get(`/comments/${this.topic_id}/${this.comment.id}`);
      this.replyList = res.data;
    },
    async updateParentId() {
      await this.$store.commit('updateParentId', this.comment.id)
    },
    reply() {
      this.updateParentId();
      console.log(this.$store.state.parent_id);
      window.location.replace(`${this.topic_id}#comment-box`)
    },
  },
});
</script>

<style lang="scss" scoped>
.contents {
  // enable textarea to break line
  white-space: pre-wrap;
  padding: 1rem 0;
  .comment-info {
    font-size: 12px;
  }
  .data-margin {
    margin-right: 0.5rem;
  }
  .reply-btn {
    margin: auto 0;
    .v-icon {
      margin-right: 0.3rem;
    }
    p {
      margin: auto 0;
    }
  }
  .reply-btn {
    color: $amber;
  }
  // .comment-text {
  //   margin-bottom: 2rem;
  // }
  .replied-messages {
    color: #fff;
    background-color: $amber;
    text-decoration: none;
    padding: 0.3rem;
    margin: auto 0;
    border-radius: 10%;
    .reply_num {
      margin-right: 0.3rem;
    }
  }
}
</style>
