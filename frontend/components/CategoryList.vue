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
export default Vue.extend({
  data() {
    return {
      categories: ['アニメ', '恋愛', '悩み', '仕事', 'a', 'a', 'a', 'a', 'end'],
    }
  },
})
</script>

<style lang="scss" scoped>
section {
  background-color: #fff;
  padding: 1rem;
  margin-top: 2rem;
  .subtitle {
    text-align: left;
    color: $amber;
  }
}
</style>
