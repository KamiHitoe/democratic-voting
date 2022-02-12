<template>
  <div v-if="liked_status" class="like-btn d-flex flex-row ml-auto">
    <v-btn icon color="pink" @click="unlike">
      <v-icon>mdi-heart</v-icon>
    </v-btn>
    <p>{{ liked_num }}</p>
  </div>
  <div v-else class="like-btn-disabled d-flex flex-row ml-auto">
    <v-btn icon color="gray" @click="like">
      <v-icon>mdi-heart</v-icon>
    </v-btn>
    <p>{{ liked_num }}</p>
  </div>

</template>

<script lang="ts">
import Vue, { PropType } from "vue";
import { User, Comment } from "@/types";

export default Vue.extend({
  props: {
    user: { type: Object as PropType<User>},
    comment: { type: Object as PropType<Comment> },
  },
  data() {
    return {
      liked_status: false as boolean,
      liked_num: 0 as number,
      params: {
        user_id: this.user.id,
        comment_id: this.comment.id,
      }
    };
  },
  created() {
    this.countLikes();
    this.getLikedStatus();
  },
  methods: {
    async countLikes() {
      const res = await this.$axios.get("/count-likes", {
        params: {
          comment_id: this.comment.id,
        },
      });
      this.liked_num = res.data.liked_num;
    },
    async getLikedStatus() {
      const res = await this.$axios.get("/likes", {
        params: this.params,
      });
      this.liked_status = res.data.liked_status;
    },
    async like() {
      this.liked_status = true;
      await this.$axios.post("likes", this.params);
      this.countLikes();
    },
    async unlike() {
      this.liked_status = false;
      await this.$axios.delete("likes", { 
        data: this.params
      });
      this.countLikes();
    },
  },
});
</script>

<style lang="scss" scoped>
.like-btn {
  margin: auto 0;
  .v-icon {
    margin-right: 0.3rem;
  }
  p {
    margin: auto 0;
  }
}
.like-btn {
  color: $pink;
}
.like-btn-disabled {
  color: $gray;
}

</style>
