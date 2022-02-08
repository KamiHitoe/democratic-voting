<template>
  <p>{{ result }}</p>
</template>

<script lang="ts">
import Vue from 'vue'
import Fuse from 'fuse.js'
import { topicsList } from '@/data'

export default Vue.extend({
  data() {
    return {
      result: {},
    }
  },
  created() {
    this.result = this.fuse()
  },
  methods: {
    fuse() {
      const options = {
        includeScore: true,
        keys: ['title', 'description']
      }

      const fuse = new Fuse(topicsList, options)
      const result = fuse.search('最です')
      console.log(result);
      return result
    },
  },
})
</script>


