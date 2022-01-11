<template>
  <v-app>
    <!-- adjust height -->

      <v-app-bar
        color="deep-purple"
        dark
        max-height="60px"
      >
        <!-- render icon -->
        <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>

        <v-toolbar-title>Menu</v-toolbar-title>
      </v-app-bar>

      <v-navigation-drawer
        v-model="drawer"
        floating
        app
      >

        <v-list
          color="deep-purple"
          dark
          nav
        >
          <v-list-item
            v-for="(item, i) in navItems"
            :key="i"
            :to="item.to"
            router
            exact
          >
            <v-list-item-action>
              <!-- jump href page when you push icon -->
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title v-text="item.title" />
            </v-list-item-content>
          </v-list-item>
        </v-list>

      </v-navigation-drawer>
    


    <v-main>
      <v-container>
        <Nuxt />
      </v-container>
    </v-main>

    <v-footer
      :absolute="!fixed"
      app
    >
      <span class="footer-text">WeWorld.com &copy; {{ new Date().getFullYear() }}</span>
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
          icon: 'mdi-apps',
          title: 'Home',
          to: '/'
        },
        {
          icon: 'mdi-apps',
          title: 'Search',
          to: '/'
        },
        {
          icon: 'mdi-apps',
          title: 'Messages',
          to: '/'
        },
        {
          icon: 'mdi-apps',
          title: 'About',
          to: '/'
        },
        {
          icon: 'mdi-apps',
          title: 'Notifications',
          to: '/'
        },
        {
          icon: 'mdi-apps',
          title: 'Matches',
          to: '/'
        },
        {
          icon: 'mdi-apps',
          title: 'Setting',
          to: '/'
        },
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'Vuetify.js'
    }
  }
}
</script>

<style lang="scss">
.footer-text {
  text-align: center;
}
</style>
