<template>
  <section>
    <div class="contents">
      <h4 class="subtitle">キーワードかカテゴリーからお題を検索しよう！</h4>
      <v-divider></v-divider>
      <div class="d-flex flex-row">
        <v-select
          v-model="sort"
          :items="sortItems"
          label="並び替え順"
          item-color="amber"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
        <v-select
          v-model="period"
          :items="periodItems"
          label="検索期間"
          item-color="amber"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
        <v-select
          v-model="sex"
          :items="sexItems"
          label="性別限定"
          item-color="amber"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
        <v-select
          v-model="age"
          :items="ageItems"
          label="年代限定"
          item-color="amber"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
      </div>

      <v-btn class="search-topics" color="amber" dark
        @click="searchTopicsByQuery"
        >お題を検索する</v-btn
      >

      <Topics v-for="(topics, i) in topicsList"
        :key="topics.id"
        :topics="topics"
        :order="i+1"
      />
    </div>

    <CategorySection />
  </section>
</template>

<script lang="ts">
import Vue from "vue";
import Fuse from "fuse.js"
import CategorySection from "@/components/CategorySection.vue";
import Topics from "@/components/topics/Topics.vue";
import { Topic } from "@/types";

export default Vue.extend({
  components: {
    CategorySection,
    Topics,
  },
  data() {
    return {
      sexItems: [
        {text: "男性", value: "男性"},
        {text: "女性", value: "女性"},
      ] as Object[],
      ageItems: [
        {text: "10代", value: 10},
        {text: "20代", value: 20},
        {text: "30代", value: 30},
        {text: "40代", value: 40},
        {text: "50代", value: 50},
      ] as Object[],
      sortItems: [
        {text: "新着順", value: "new"},
        {text: "投票数順", value: "ranking"},
      ] as Object[],
      periodItems: [
        {text: "1年以内", value: "yearly"},
        {text: "1ヶ月以内", value: "monthly"},
        {text: "1週間以内", value: "weekly"},
      ] as Object[],
      sex: "" as String,
      age: 0 as Number,
      sort: "" as String,
      period: "" as String,
      topicsList: [] as Topic[],
    };
  },
  created() {
    if (this.$route.query.category_id) {
      this.searchTopicsByCategory();
    } else if (this.$route.query.q) {
      this.searchTopicsByKeyword();
    }
  },
  methods: {
    async searchTopicsByCategory() {
      const res = await this.$axios.get(`search?category_id=${this.$route.query.category_id}`)
      this.topicsList = res.data;
    },
    async searchTopicsByQuery() {
      const res = await this.$axios.get(`search?category_id=${this.$route.query.category_id}&sort=${this.sort}&period=${this.period}&sex=${this.sex}&age=${this.age}`)
      this.topicsList = res.data;
    },
    async searchTopicsByKeyword() {
      console.log('start')
      const options = {
        includeScore: false,
        keys: ['title', 'description']
      }
      const res = await this.$axios.get("search")
      const fuse = new Fuse(res.data, options)
      const topicsObj: any = fuse.search(this.$route.query.q)
      const topicsList: Topic[] = topicsObj.map((obj: any) => obj.item)
      console.log(topicsList)
      this.topicsList = topicsList;
    }
  },
});
</script>

<style lang="scss" scoped>
.subtitle {
  @extend %subtitle;
}
.contents {
  padding: 1rem;
  background-color: #fff;
}
.v-select {
  max-width: 150px;
  margin: 1rem 2rem 0 0;
}
.search-topics {
  margin-bottom: 1rem;
}
</style>
