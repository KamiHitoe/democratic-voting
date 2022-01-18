<template>
  <main>
    <v-btn class="create-topics" color="amber" to="/create-topics" dark>新しくお題を作成する</v-btn>
    <br>

    <v-tabs
      v-model="tab"
      color="amber"
      slider-color="amber"
      centered
      fixed-tabs  
    >
      <v-tab v-for="(item, i) in tabItems" :key=i>
        {{ item.title }}
      </v-tab>
    </v-tabs>
    <Topics 
      v-for="topics in topicsList"
      :key="topics.id"
      :topics=topics
    />

    <CategoryList />



  </main>
</template>

<script lang="ts">
import Vue from 'vue'
import { topicsList } from '../data/data'
import CategoryList from '../components/CategoryList.vue'
import Topics from '../components/Topics.vue'

export default Vue.extend({
  name: 'IndexPage',
  components: {
    CategoryList,
    Topics,
  },
  data() {
    return {
      tab: null,
      tabItems: [
        {title: '急上昇中のお題'},
        {title: '新着のお題'},
        {title: '殿堂入りのお題'},
      ],
      topicsList: topicsList,
    }
  },
})
</script>

<style lang="scss" scoped>
main {
  text-align: center;
}
img {
  max-height: 30rem;
  padding: 30px 0;
}
.create-topics {
  margin-bottom: 2rem;
}
</style>
