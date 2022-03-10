<template>
  <section>
    <div v-if="$store.state.voted_status">
      <p class="voted-comment">投票ありがとうございました！</p>
    </div>
    <div v-else>
      <v-btn
        v-if="!voting"
        class="vote-btn"
        color="amber"
        dark
        @click="openVoting"
        >投票する
      </v-btn>

      <div v-else>
        <div class="contents">
          <v-divider></v-divider>
          <p>一人一票しか投票できないので、注意して投票してね！</p>
          <v-radio-group v-model="chosenOption">
            <v-radio
              :label="topic.option_1"
              value=1
              color="amber"
            ></v-radio>
            <v-radio
              :label="topic.option_2"
              value=2
              color="amber"
            ></v-radio>
            <v-radio
              v-if="topic.option_3"
              :label="topic.option_3"
              value=3
              color="amber"
            ></v-radio>
            <v-radio
              v-if="topic.option_4"
              :label="topic.option_4"
              value=4
              color="amber"
            ></v-radio>
          </v-radio-group>
        </div>

        <v-btn class="vote-btn" color="amber" dark @click="submitVoting"
          >投票する</v-btn
        >

      </div>
    </div>
  </section>
</template>

<script lang="ts">
import Vue, { PropType } from "vue";
import mixins from "vue-typed-mixins";
import global from "@/mixins";
import { User, Topic } from "@/types";

export default mixins(global).extend({
  props: {
    user: { type: Object as PropType<User> },
    topic: { type: Object as PropType<Topic> },
  },
  mixins: [
    global,
  ],
  data() {
    return {
      chosenOption: null as string,
      voting: false as boolean,
    };
  },
  methods: {
    async submitVoting() {
      if (this.user.uid) {
        // 登録済ユーザのみ投票可能
        if (this.chosenOption !== null) {
          await this.$axios.post("votes", {
            user_id: this.user.id,
            topic_id: this.topic.id,
            sex: this.user.sex,
            age: this.user.age,
            chosen_option: this.chosenOption,
          })
          window.location.reload();
          // window.location.replace(`/topics/${this.topic.id}`);
        }
      } else {
        this.updateShowModal();
      }
    },
    openVoting() {
      this.voting = true;
    },
  },
});
</script>

<style lang="scss" scoped>
.vote-btn,
.voted-comment {
    margin: 2rem 0;
  }
.contents {
  padding: 1rem 0;
}
hr {
  margin: 1rem;
}
</style>
