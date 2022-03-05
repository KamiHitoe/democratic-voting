<template>
  <section>
    <h4 class="subtitle">カテゴリー一覧</h4>
    <v-divider></v-divider>
    <div class="grid-container">
      <div class="grid-item" v-for="(category, i) in categoryList" :key="i" cols="4">
        <a class="category" :href="`/search?category_id=${category.id}`">{{ category.category }}</a>
        <!-- <nuxt-link :to="`/search?category_id=${category.id}`" class="category">{{ category.category }}</nuxt-link> -->
      </div>
    </div>
  </section>
</template>

<script lang="ts">
import Vue from "vue";
import { Category } from "@/types";
import { categoryList } from "@/data";

export default Vue.extend({
  props: {
    removeZero: Boolean,
  },
  data() {
    return {
      categoryList: categoryList as Category[],
    };
  },
});
</script>

<style lang="scss" scoped>
section {
  @extend %section-body;
}
@media (max-width: 600px) {
  .grid-container {
    grid-template-columns: repeat(2, auto);
  }
  .category {
    font-size: 14px;
  }
}
@media (min-width: 600px) {
  .grid-container {
    grid-template-columns: repeat(3, auto);
  }
}
.grid-container {
  display: grid;
}
.grid-item {
  margin: 0.5rem 0;
}
.category {
  color: #000;
  &:hover {
    color: $amber;
  }
}
</style>
