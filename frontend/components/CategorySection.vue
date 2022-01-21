<template>
  <section>
    <h4 class="subtitle">カテゴリー一覧</h4>
    <v-divider></v-divider>
    <v-container>
      <v-row>
        <v-col v-for="(category, i) in categories" :key=i cols="4">
          {{ category }}
        </v-col>
      </v-row>
    </v-container>

  </section>
</template>

<script lang="ts">
import Vue from 'vue'
import { CategoryList } from '../data/data'

export default Vue.extend({
  data() {
    return {
      orgCategories: CategoryList,
      categories: [],
    }
  },
  created() {
    for (let i in this.orgCategories) {
      if (i != 0) {
        this.categories.push(this.orgCategories[i][i]);
      }
    }
  }
})
</script>

<style lang="scss" scoped>
section {
  @extend %section-body;
  .subtitle {
    @extend %subtitle;
  }
}
</style>
