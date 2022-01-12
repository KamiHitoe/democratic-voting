<template>
  <main>
    <form @submit.prevent="submit">
      <v-text-field
        label="Search User"
        placeholder="please input"
        solo
        required
      ></v-text-field>
      <v-btn
        class="gray"
        type="submit"
      >submit</v-btn>
    </form>

    <v-container v-if ="userItems">
      <div v-for="(user, i) in userItems" :key=i>
        <v-row>{{user.username}}</v-row>
      </div>
    </v-container>

  </main>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  name: 'IndexPage',
  data() {
    return {
      userItems: [
        {
        username: 'foo',
        description: "I'm foo",
        },
        {
        username: 'bar',
        description: "I'm bar",
        },
      ]
    }
  },
})
</script>

<style lang="scss" scoped>
main {
  text-align: center;
}
img {
  max-height: 30rem;
  padding: 30px 0;
}
</style>
