<template>
  <v-app>
    <header>
      <div class="d-flex flex-row justify-space-between amber">
        <NuxtLink class="header-title d-flex flex-row" to="/">
          <h1>みんなの投票箱</h1>
          <v-icon color="white" large>mdi-mailbox</v-icon>
        </NuxtLink>
        <v-menu
          left
          bottom
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              icon
              v-bind="attrs"
              v-on="on"
            >
              <v-icon large color="white">mdi-menu</v-icon>
            </v-btn>
          </template>

          <v-list>
            <v-list-item
              v-for="n in 5"
              :key="n"
              @click="() => {}"
            >
              <v-list-item-title>Option {{ n }}</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
      </div>
      
      <div class="d-flex flex-row justify-space-between header-subtitle">
        <h4 class="subtitle">気になることをみんなの投票で決めよう！</h4>
        <v-text-field
          v-model="keyword"
          :append-icon="'mdi-magnify'"
          class="search-bar"
          label="search"
          outlined
          dense
          type="text"
          required
          @click:append="searchByKeyword"
        ></v-text-field>
      </div>

    </header>


    <v-main>
      <v-container
        fluid
      >
        <Nuxt />
      </v-container>
    </v-main>

    <v-btn
      id="scroll-to-top"
      color="amber"
      dark
      fixed
      bottom
      right
      fab
      @click="moveTop"
    >
      ∧
    </v-btn>

    <v-footer
      :absolute="!fixed"
      app
      color="amber"
      dark
    >
      <span class="footer-text">DemocraticVoting.com &copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  name: 'DefaultLayout',
  data () {
    return {
    }
  },
  methods: {
    searchByKeyword() {
      console.log('search by keyword');
    },
    moveTop() {
      document.body.scrollTop = 0; // For Safari
      document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    },
  }
}
</script>

<style lang="scss">
.v-application--wrap {
  background-color: $amber-lighten-5;
}
header {
  .header-title {
    margin-bottom: 0.3rem;
    text-decoration: none;
    h1 {
      color: $amber-lighten-5;
      margin-left: 0.5rem;
    }
  }
  .subtitle {
    margin-top: 0.3rem;
  }
}
.header-subtitle {
  color: $amber;
  margin: 0.5rem 1rem 0;
}
.v-main {
  margin: 0 1rem 3rem;
}
.search-bar {
  max-width: 30rem;
}
</style>
