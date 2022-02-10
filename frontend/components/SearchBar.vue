<template>
  <v-text-field
    v-model="keyword"
    :append-icon="'mdi-magnify'"
    class="search-bar"
    color="amber"
    label="お題を検索する"
    outlined
    dense
    type="text"
    required
    @click:append="toSearchWithKeyword"
  ></v-text-field>

</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      keyword: "" as String,
    };
  },
  methods: {
    toSearchWithKeyword() {
      window.location.replace(`/search?keyword=${this.keyword}`);
    },
  },
})
</script>

<style lang="scss">
.search-bar {
  max-width: 30rem;
}
</style>
