<template>
  <v-app>
    <header>
      <div class="d-flex flex-row justify-space-between amber">
        <div class="d-flex flex-row header-title">
          <h1>　みんなの投票箱</h1>
          <v-icon color="white" large>mdi-mailbox</v-icon>
        </div>
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
              <v-icon>mdi-menu</v-icon>
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
        <h4>気になることをみんなの投票で決めよう！</h4>
        <v-text-field
          v-model="keyword"
          :append-icon="'mdi-magnify'"
          class="search-bar"
          height="28px"
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
      clipped: false,
      drawer: false,
      fixed: false,
      navItems: [
        {
          icon: 'mdi-home',
          title: 'Home',
          to: '/',
        },
        {
          icon: 'mdi-magnify',
          title: 'Search',
          to: '/search',
        },
        {
          icon: 'mdi-email',
          title: 'Messages',
          to: '/messages',
        },
        {
          icon: 'mdi-pencil',
          title: 'About',
          to: '/about',
        },
        {
          icon: 'mdi-bell',
          title: 'Notifications',
          to: '/notifications',
        },
        {
          icon: 'mdi-account-multiple',
          title: 'Matches',
          to: '/',
        },
        {
          icon: 'mdi-cog',
          title: 'Setting',
          to: '/',
        },
      ],
      miniVariant: false,
      title: 'Menu'
    }
  },
  methods: {
    searchByKeyword() {
      console.log('search by keyword');
    }
  }
}
</script>

<style lang="scss">
.v-application--wrap {
  background-color: #FFF8E1;
}
header {
  .header-title {
    color: #FFF8E1;
    margin-bottom: 0.3rem;
  }
  h4 {
    margin-top: 0.3rem;
  }
}
.header-subtitle {
  color: #FFC107;
  margin: 0.5rem 1rem 0;
}
.v-main {
  margin: 0 1rem;
}
.footer-text {
  text-align: center;
}
.search-bar {
  max-width: 30rem;
}
</style>
