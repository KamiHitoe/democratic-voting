<template>
  <main>
    <v-tabs
      v-model="tab"
      color="deep-purple"
      slider-color="deep-purple"
      centered
      fixed-tabs  
    >
      <v-tab v-for="(item, i) in tabItems" :key=i>
        {{ item.title }}
      </v-tab>
    </v-tabs>
    <v-tabs-items v-model="tab">
      <v-tab-item v-for="(item, i) in tabItems" :key=i>
        <v-card flat>
          <v-card-text v-text="item.description"></v-card-text>
        </v-card>
      </v-tab-item>
    </v-tabs-items>


  </main>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  name: 'IndexPage',
  data() {
    return {
      tab: null,
      tabItems: [
        {
          title: 'title 1',
          description: 'this description describe about title 1',
        },
        {
          title: 'title 2',
          description: 'this description describe about title 2',
        },
        {
          title: 'title 3',
          description: 'this description describe about title 3',
        },
      ],
    }
  },
})
</script>

<style lang="scss" scoped>
.v-avatar {
  margin-bottom: 2rem;
}

</style>

