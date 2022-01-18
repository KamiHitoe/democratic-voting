<template>
  <section>
    <div class="contents">
      <h4>キーワードかカテゴリーからお題を検索しよう！</h4>
      <v-divider></v-divider>
      <div class="d-flex flex-row">
        <v-select
          :items="optionItems"
          label="新着順"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
        <v-select
          :items="optionItems"
          label="1年以内"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
      </div>
      <Topics 
        v-for="topics in topicsList"
        :key="topics.id"
        :topics=topics
      />
    </div>

    <CategoryList />

  </section>
</template>

<script lang="ts">
import Vue from 'vue'
import { topicsList } from '../data/data'
import CategoryList from '../components/CategoryList.vue'
import Topics from '../components/Topics.vue'

export default Vue.extend({
  components: {
    CategoryList,
    Topics,
  },
  data() {
    return {
      optionItems: ['foo', 'bar', 'hoge'],
      topicsList: topicsList,
    }
  },
})
</script>

<style lang="scss" scoped>
h4 {
  text-align: left;
  color: #FFC107;
}
.contents {
  padding: 1rem;
  background-color: #fff;
}
.v-select {
  max-width: 150px;
  margin: 1rem 2rem 0 0;
}
</style>
