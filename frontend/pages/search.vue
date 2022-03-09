<template>
  <section>
    <div class="contents">
      <h4 v-if="$route.query.category_id" class="subtitle">{{ category }}カテゴリーの検索結果</h4>
      <h4 v-else class="subtitle">キーワードかカテゴリーからお題を検索しよう！</h4>
      <v-divider></v-divider>
      <div class="grid-container">
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

      <Topics v-for="(topic, i) in topicList.slice((page-1)*limit, page*limit)"
        :key="topic.id"
        :topic="topic"
        :order="i+1 + (page-1)*limit"
      />

      <v-pagination
        v-model="page"
        v-if="(topicList.length !== 0)"
        :length="Math.ceil(topicList.length / limit)"
        :total-visible="7"
        color="amber"
      ></v-pagination>

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
import { categoryList } from "@/data";

export default Vue.extend({
  components: {
    CategorySection,
    Topics,
  },
  computed: {
    category() {
      return categoryList[this.$route.query.category_id - 1].category
    }
  },
  data() {
    return {
      sexItems: [
        {text: "なし", value: null},
        {text: "男性限定", value: "male"},
        {text: "女性限定", value: "female"},
      ] as object[],
      ageItems: [
        {text: "なし", value: null},
        {text: "10代限定", value: 10},
        {text: "20代限定", value: 20},
        {text: "30代限定", value: 30},
        {text: "40代限定", value: 40},
        {text: "50代限定", value: 50},
      ] as object[],
      sortItems: [
        {text: "新着順", value: "new"},
        {text: "投票数順", value: "ranking"},
      ] as object[],
      periodItems: [
        {text: "1年以内", value: "yearly"},
        {text: "1ヶ月以内", value: "monthly"},
        {text: "1週間以内", value: "weekly"},
      ] as object[],
      sex: "" as string,
      age: 0 as number,
      sort: "" as string,
      period: "" as string,
      topicList: [] as Topic[],
      page: 1 as number,
      limit: 30 as number,
    };
  },
  created() {
    if (this.$route.query.category_id) {
      this.searchTopicsByQuery();
    } else if (this.$route.query.keyword) {
      this.searchTopicsByKeyword();
    }
  },
  methods: {
    async searchTopicsByQuery() {
      const res = await this.$axios.get(`/search?category_id=${this.$route.query.category_id}&sort=${this.sort}&period=${this.period}&sex=${this.sex}&age=${this.age}&page=${this.page-1}`)
      this.topicList = res.data;
      console.log(res.data)
    },
    async searchTopicsByKeyword() {
      console.log('start')
      const options = {
        includeScore: false,
        keys: ['title', 'description']
      }
      // 一度すべての検索結果を受け取る
      const res = await this.$axios.get(`/search?keyword=${this.$route.query.keyword}`)
      const fuse = new Fuse(res.data, options)
      console.log(res.data)
      const topicsObj: any = fuse.search(this.$route.query.keyword)
      console.log(topicsObj)
      const topicList: Topic[] = topicsObj.map((obj: any) => obj.item)
      this.topicList = topicList;
      console.log(this.topicList)
    },
  },
});
</script>

<style lang="scss" scoped>
.subtitle {
  @extend %subtitle;
}
@media (min-width: 600px) {
  .grid-container {
    display: grid;
    grid-template-columns: repeat(4, auto);
    margin-top: 1rem;
  }
  .v-select {
    max-width: 150px;
  }
}
@media (max-width: 600px) {
  .grid-container {
    display: grid;
    grid-template-columns: repeat(2, auto);
    margin-top: 1rem;
  }
  .v-select {
    max-width: 130px;
  }
}
.contents {
  padding: 1rem;
  background-color: #fff;
}

.search-topics {
  margin-bottom: 1rem;
}
</style>
