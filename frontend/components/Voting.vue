<template>
  <section>

    <div class="contents">
      <v-divider></v-divider>
      <p>一人一票しか投票できないので、注意して投票してね！</p>
      <v-radio-group v-model="chosenOption">
        <v-radio :label="topics.option_1" value="option_1_num" color="amber"></v-radio>
        <v-radio :label="topics.option_2" value="option_2_num" color="amber"></v-radio>
        <v-radio :label="topics.option_3" value="option_3_num" color="amber" v-if="topics.option_3"></v-radio>
        <v-radio :label="topics.option_4" value="option_4_num" color="amber" v-if="topics.option_4"></v-radio>
      </v-radio-group>
    </div>
    <v-btn class="vote-btn" color="amber" dark @click="submitVoting">投票する</v-btn>
  </section>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      chosenOption: null,
    }
  },
  props: {
    topics: Object,
  },
  methods: {
    async submitVoting() {
      if (this.chosenOption !== null) {
        await this.$axios.put(`/topics/${this.topics.id}`, {
          chosen_option: this.chosenOption,
        });
        window.location.reload();
      }
    }
  }
})
</script>

<style lang="scss" scoped>
.contents {
  padding: 1rem 0;
}
hr {
  margin: 1rem;
}
</style>
