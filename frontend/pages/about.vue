<template>
  <main>
    <v-card
      class="mx-auto"
      max-width="480px"
      height="600px"
    >
      <v-avatar size="300px">
        <v-img src="https://avatars.githubusercontent.com/u/46081776?v=4">
        </v-img>
      </v-avatar>
      <v-card-title>{{ username }}</v-card-title>
      <v-card-subtitle>{{ subtitle }}</v-card-subtitle>
      <v-card-text>{{ text }}</v-card-text>
      <v-btn class="pink" rounded dark>edit mypage</v-btn>

    </v-card>


  </main>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  name: 'IndexPage',
  data() {
    return {
      username: 'miyuki',
      subtitle: 'this is a subtitle',
      text: "I'm a software engineer beginner",
    }
  },
})
</script>

<style lang="scss" scoped>
.v-avatar {
  margin-bottom: 2rem;
}

</style>

