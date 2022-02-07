<template>
  <section>
    <h4 class="subtitle">カテゴリー一覧</h4>
    <v-divider></v-divider>
    <v-container>
      <v-row>
        <v-col v-for="(category, i) in categories" :key="i" cols="4">
          <a :href="`/search?category_id=${category.id}`" class="category">{{ category.category }}</a>
        </v-col>
      </v-row>
    </v-container>
  </section>
</template>

<script lang="ts">
import Vue from "vue";
import { Category } from "@/types";
import { categoryList } from "@/data/data";

export default Vue.extend({
  data() {
    return {
      orgCategories: categoryList as Category[],
      categories: [] as Category[],
    };
  },
  created() {
    this.removeZero();
  },
  methods: {
    removeZero() {
      for (const i in this.orgCategories) {
        if (i !== "0") {
          this.categories.push(this.orgCategories[i]);
        }
      }
    },
  },
});
</script>

<style lang="scss" scoped>
section {
  @extend %section-body;
  .subtitle {
    @extend %subtitle;
  }
}
.category {
  color: #000;
  &:hover {
    color: $amber;
  }
}
</style>
