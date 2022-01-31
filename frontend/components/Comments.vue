<template>
  <section>
    <div class="contents">
      <div class="comment-info d-flex flex-row">
        <p class="data-margin">{{ order }}.</p>
        <p class="data-margin">名無しさん</p>
        <p class="data-margin">{{ comment.timestamp }}</p>
        <button class="reply-btn d-flex flex-row ml-auto">
          <v-icon color="amber">mdi-reply</v-icon>
          <p>返信</p>
        </button>
      </div>
      <p class="comment-text data-margin">{{ comment.text }}</p>
      <div class="d-flex flex-row">
        <NuxtLink class="replied-messages d-flex flex-row" to="#">
          <h5 class="reply_num">{{ comment.reply_num }}件の返信</h5>
          <v-icon color="white" small>mdi-message</v-icon>
        </NuxtLink>

        <div v-if="liked_status" class="like-btn d-flex flex-row ml-auto">
          <v-btn icon color="pink" @click="unlike">
            <v-icon>mdi-heart</v-icon>
          </v-btn>
          <p>{{ like_num }}</p>
        </div>
        <div v-else class="like-btn-disabled d-flex flex-row ml-auto">
          <v-btn icon color="gray" @click="like">
            <v-icon>mdi-heart</v-icon>
          </v-btn>
          <p>{{ like_num }}</p>
        </div>
      </div>
    </div>

    <v-divider></v-divider>
  </section>
</template>

<script lang="ts">
import Vue, { PropType } from "vue";
import { Comment } from "@/types";

export default Vue.extend({
  props: {
    comment: { type: Object as PropType<Comment> },
    order: { type: Number },
  },
  data() {
    return {
      user: {id: 1} as Object,
      liked_status: false as boolean,
      like_num: 0 as number,
    }
  },
  created() {
    this.countLikes();
    this.getLikedStatus();
  },
  methods: {
    async countLikes() {
      const res = await this.$axios.get(`/likes/${this.comment.id}`);
      this.like_num = res.data.like_num;
    },
    async getLikedStatus() {
      const res = await this.$axios.get(`/likes/${this.user.id}/${this.comment.id}`);
      this.liked_status = res.data.liked_status;
    },
    async like() {
      this.liked_status = true;
      await this.$axios.post(`likes/${this.user.id}/${this.comment.id}`);
      this.countLikes();
    },
    async unlike() {
      this.liked_status = false;
      await this.$axios.delete(`likes/${this.user.id}/${this.comment.id}`);
      this.countLikes();
    },
  },
});
</script>

<style lang="scss" scoped>
.contents {
  padding: 1rem 0;
  .comment-info {
    font-size: 12px;
  }
  .data-margin {
    margin-right: 0.5rem;
  }
  .reply-btn,
  .like-btn {
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
  .like-btn {
    color: $pink;
  }
  .like-btn-disabled {
    color: $gray;
  }
  .comment-text {
    margin-bottom: 2rem;
  }
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
