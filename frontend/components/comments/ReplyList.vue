<template>
  <nuxt-link v-if="replyList.length" class="replied-messages d-flex flex-row" :to="`/topics/${topic_id}/${comment.id}`">
    <h5 class="reply_num">{{ replyList.length }} 件の返信</h5>
    <v-icon color="white" small>mdi-message</v-icon>
  </nuxt-link>
  <p v-else></p>

</template>

<script lang="ts">
import Vue, { PropType } from "vue";
import { Comment } from "@/types";

export default Vue.extend({
  props: {
    topic_id: { type: Number },
    comment: { type: Object as PropType<Comment> },
  },
  data() {
    return {
      replyList: [] as Comment[],
    };
  },
  created() {
    this.getReplyList();
  },
  methods: {
    async getReplyList() {
      const res = await this.$axios.get(`/comments/${this.topic_id}/${this.comment.id}`);
      this.replyList = res.data;
    },
  },
});
</script>

<style lang="scss" scoped>
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
</style>
