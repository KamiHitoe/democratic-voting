<template>
  <section class="related-topics">
    <h4 class="subtitle">関連するお題</h4>
    <v-divider></v-divider>
    <Topics 
      v-for="(topics, i) in topicsList"
      :key="topics.id"
      :topics="topics"
      :order="i+1"
    />

  </section>
</template>

<script lang="ts">
import Vue from 'vue'
import { topicsList } from '../data/data'
import Topics from '../components/Topics.vue'

export default Vue.extend({
  components: {
    Topics,
  },
  data() {
    return {
      topicsList: topicsList,
    }
  },
})
</script>

<style lang="scss" scoped>
.related-topics {
  background-color: #fff;
  padding: 1rem;
  margin-top: 2rem;
  .subtitle {
    @extend %subtitle;
  }
}
</style>
