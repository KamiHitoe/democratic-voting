<template>
  <main>
    <form @submit.prevent="submit" class="flex-form">
      <v-text-field
        append-icon="mdi-magnify"
        label="Search User"
        placeholder="please input"
        height="48px"
        solo
        required
      ></v-text-field>
      <v-btn
        class="deep-purple"
        type="submit"
        dark
      >search</v-btn>
    </form>

    <v-container v-if="userItems" class="search-result">
        <v-row>
          <v-col v-for="(user, i) in userItems" :key=i cols="4">
            <v-card>
              <v-list-item-avatar>
                <v-img src="https://avatars.githubusercontent.com/u/46081776?v=4">
                </v-img>
              </v-list-item-avatar>
              <v-list-item-title>
                {{user.username}}
              </v-list-item-title>
            </v-card>
          </v-col>
        </v-row>
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
        {
        username: 'bar',
        description: "I'm bar",
        },
        {
        username: 'bar',
        description: "I'm bar",
        },
        {
        username: 'bar',
        description: "I'm bar",
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
.flex-form {
  display: flex;
  .v-btn {
    height: 48px;
    margin: 0 0 0.5rem 1rem;
  }
}
.v-text-field {
  max-width: 50rem;
  margin: auto 0;
}
.search-result {
  text-align: center;
  margin-top: 3rem;
}
</style>
