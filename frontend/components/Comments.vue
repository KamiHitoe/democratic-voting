<template>
  <section>

    <div class="contents">
      <div class="comments-info d-flex flex-row">
        <p class="data-margin">{{ comment.id }}.</p>
        <p class="data-margin">名無しさん</p>
        <p class="data-margin">{{ comment.created_at }}</p>
        <button class="reply-btn d-flex flex-row ml-auto">
          <v-icon color="amber">mdi-reply</v-icon>
          <p>返信</p>
        </button>
      </div>
      <p class="data-margin">{{ comment.text }}</p>
      <div class="d-flex flex-row">
        <NuxtLink class="replied-messages d-flex flex-row" to="#">
          <h4 class="topics-title">{{ comment.reply_num }}件の返信</h4>
          <v-icon color="white">mdi-message</v-icon>
        </NuxtLink>
        <button class="like-btn d-flex flex-row ml-auto">
          <v-icon color="amber">mdi-heart</v-icon>
          <p>{{ comment.like_num }}</p>
        </button>
      </div>
    </div>
    
    <v-divider></v-divider>
  </section>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
    }
  },
  props: {
    comment: Object,
  }
})
</script>

<style lang="scss" scoped>
.contents {
  padding: 1rem 0;
  .comments-info {
    font-size: 12px;
  }
  .data-margin {
    margin-right: 0.5rem;
  }
  .reply-btn, .like-btn {
    color:$amber;
    margin: auto 0;
    .v-icon {
      margin-right: 0.3rem;
    }
    p {
      margin: auto 0;
    }
  }
  .replied-messages {
    color: #fff;
    background-color: $amber;
    text-decoration: none;
    padding: 0.3rem;
    margin: auto 0;
    .topics-title {
      margin-right: 0.3rem;
    }
  }
}
</style>
