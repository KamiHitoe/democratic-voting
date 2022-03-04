<template>
  <section class="related-topics">
    <h4 class="subtitle">関連するお題</h4>
    <v-divider></v-divider>
    <Topics
      v-for="(topic, i) in topicsList"
      :key="topic.id"
      :topic="topic"
      :order="i + 1"
    />
  </section>
</template>

<script lang="ts">
import Vue, { PropType } from "vue";
import Topics from "@/components/topics/Topics.vue";
import { Topic } from "@/types";

export default Vue.extend({
  components: {
    Topics,
  },
  props: {
    topic: { type: Object as PropType<Topic> },
  },
  data() {
    return {
      topicsList: [] as Topic[],
    };
  },
  watch: {
    topic() {
      this.searchRelatedTopics();
    }
  },
  methods: {
    async searchRelatedTopics() {
      const res = await this.$axios.get("/search", {
        params: {
          category_id: this.topic.category_id,
        },
      });
      this.topicsList = res.data;
      // topicsListから自分のデータを除外
      for (let i in this.topicsList) {
        if (this.topicsList[i].id === this.topic.id) {
          this.topicsList.splice(parseInt(i), 1);
        }
      }
    },
  },
});
</script>

<style lang="scss" scoped>
.related-topics {
  background-color: #fff;
  padding: 1rem;
  margin-top: 2rem;
}
</style>
