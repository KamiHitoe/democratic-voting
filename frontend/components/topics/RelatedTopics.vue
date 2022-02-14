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
import Vue from "vue";
import { topicsList } from "@/data";
import Topics from "@/components/topics/Topics.vue";

export default Vue.extend({
  components: {
    Topics,
  },
  data() {
    return {
      topicsList,
    };
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
