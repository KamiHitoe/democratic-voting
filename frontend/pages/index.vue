<template>
  <main>
    <v-btn class="create-topics" color="amber" to="/create-topics" dark
      >新しくお題を作成する</v-btn
    >
    <br />

    <v-tabs
      v-model="tab"
      color="amber"
      slider-color="amber"
      centered
      fixed-tabs
    >
      <v-tab 
        v-for="(item, i) in tabItems"
        :key="i"
        @click="getTopics(item.q)"
      >
        {{ item.title }}
      </v-tab>
    </v-tabs>
    <Topics
      v-for="(topics, i) in topicsList"
      :key="topics.id"
      :topics="topics"
      :order="i + 1"
    />

    <CategorySection />
  </main>
</template>

<script lang="ts">
import Vue from "vue";
import CategorySection from "@/components/CategorySection.vue";
import Topics from "@/components/topics/Topics.vue";

export default Vue.extend({
  // name: "IndexPage",
  components: {
    CategorySection,
    Topics,
  },
  data() {
    return {
      tab: null,
      tabItems: [
        { title: "新着のお題", q: "DESC" },
        { title: "急上昇中のお題", q: "trend" },
        { title: "殿堂入りのお題", q: "ranking" },
      ],
      topicsList: [],
    };
  },
  created() {
    this.getTopics();
  },
  methods: {
    async getTopics(q: string = "DESC") {
      const res = await this.$axios.get(`/topics?q=${q}`);
      // for (const record of res.data) {
      //   console.log(record.created_at);
      //   console.log(typeof record.created_at);
      // }
      this.topicsList = res.data;
    },
  },
});
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
