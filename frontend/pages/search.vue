<template>
  <section>
    <div class="contents">
      <h4>キーワードかカテゴリーからお題を検索しよう！</h4>
      <v-divider></v-divider>
      <div class="d-flex flex-row">
        <v-select
          :items="sortItems"
          label="並び替え"
          item-color="amber"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
        <v-select
          :items="periodItems"
          label="検索期間"
          item-color="amber"
          solo
          dense
          background-color="amber lighten-4"
        ></v-select>
      </div>
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
import CategorySection from "@/components/CategorySection.vue";
import Topics from "@/components/Topics.vue";
import { Topic } from "@/types";
// import { topicsList } from "@/data/data";

export default Vue.extend({
  components: {
    CategorySection,
    Topics,
  },
  data() {
    return {
      sortItems: ["新着順", "投票数順"] as String[],
      periodItems: ["1年以内", "1ヶ月以内", "1週間以内"] as String[],
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
      const res = await this.$axios.get(`search_by_category?category_id=${this.$route.query.category_id}`)
      this.topicsList = res.data;
    },
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
</style>
