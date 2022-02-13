<template>
  <section>
    <h4 class="subtitle">カテゴリー一覧</h4>
    <v-divider></v-divider>
    <v-container>
      <v-row>
        <v-col v-for="(category, i) in categoryList" :key="i" cols="4">
          <a :href="`/search?category_id=${category.id}`" class="category">{{ category.category }}</a>
          <!-- <nuxt-link :to="`/search?category_id=${category.id}`" class="category">{{ category.category }}</nuxt-link> -->
        </v-col>
      </v-row>
    </v-container>
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
  // computed: {
  //   categories: (): Category[] => {
  //     categoryList.shift();
  //     console.log(categoryList)
  //     return categoryList;
  //   }
  // },
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
.category {
  color: #000;
  &:hover {
    color: $amber;
  }
}
</style>
