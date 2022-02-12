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
              :label="topics.option_1"
              value="option_1_num"
              color="amber"
            ></v-radio>
            <v-radio
              :label="topics.option_2"
              value="option_2_num"
              color="amber"
            ></v-radio>
            <v-radio
              v-if="topics.option_3"
              :label="topics.option_3"
              value="option_3_num"
              color="amber"
            ></v-radio>
            <v-radio
              v-if="topics.option_4"
              :label="topics.option_4"
              value="option_4_num"
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
import global from "@/mixins/global";
import { User, Topic } from "@/types";

export default Vue.extend({
  props: {
    user: { type: Object as PropType<User> },
    topics: { type: Object as PropType<Topic> },
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
          // オプションを選択してから実行
          await this.$axios.put(`/topics/${this.topics.id}`, {
            chosen_option: this.chosenOption,
          });
          await this.$axios.post("votes", {
            user_id: this.user.id,
            topic_id: this.topics.id,
          })
          window.location.reload();
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
