<template>
  <section>
    <div class="contents">
      <h4>キーワードかカテゴリーからお題を検索しよう！</h4>
      <v-divider></v-divider>
      <div class="d-flex flex-row">
        <v-select
          v-model="category"
          :items="categoryItems"
          label="カテゴリー"
          item-color="amber"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
        <v-select
          v-model="sex"
          :items="sexItems"
          label="性別"
          item-color="amber"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
        <v-select
          v-model="age"
          :items="ageItems"
          label="年代"
          item-color="amber"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
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
      </div>

      <v-btn class="search-topics" color="amber" dark
        @click="searchByQuery"
        >お題を検索する</v-btn
      >

      <Topics v-for="(topics, i) in topicsList"
        :key="topics.id"
        :topics="topics"
        :order="i+1"
      />
    </div>

    <CategorySection :removeZero="true" />
  </section>
</template>

<script lang="ts">
import Vue from "vue";
import CategorySection from "@/components/CategorySection.vue";
import Topics from "@/components/topics/Topics.vue";
import { categoryList } from "@/data";
import { Topic, Category } from "@/types";

export default Vue.extend({
  components: {
    CategorySection,
    Topics,
  },
  computed: {
    categoryItems: (): String[] => {
      const newList: String[] = [];
      for (let i in categoryList) {
        newList.push(categoryList[i].category);
      }
      return newList
    }
  },
  data() {
    return {
      sexItems: ["男性", "女性"] as String[],
      ageItems: ["10代", "20代", "30代", "40代", "50代"] as String[],
      sortItems: ["新着順", "投票数順"] as String[],
      periodItems: ["1年以内", "1ヶ月以内", "1週間以内"] as String[],
      category: "" as String,
      sex: "" as String,
      age: "" as String,
      sort: "" as String,
      period: "" as String,
      topicsList: [] as Topic[],
    };
  },
  created() {
    if (this.$route.query.category_id) {
      this.getTopicsByCategory();
    }
  },
  methods: {
    async getTopicsByCategory() {
      const res = await this.$axios.get(`search?category_id=${this.$route.query.category_id}`)
      this.topicsList = res.data;
    },
    searchByQuery() {
      console.log(`category: ${this.category}`);
      console.log(`age: ${this.age}`);
    }
  },
});
</script>

<style lang="scss" scoped>
h4 {
  text-align: left;
  color: #ffc107;
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
