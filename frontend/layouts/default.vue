<template>
  <v-app>
    <header>
      <div class="d-flex flex-row justify-space-between amber">
        <nuxt-link class="header-title d-flex flex-row" to="/">
          <h1>みんなの投票箱</h1>
          <v-icon color="white" large>mdi-mailbox</v-icon>
        </nuxt-link>
        <v-menu left bottom>
          <template #activator="{ on, attrs }">
            <v-btn icon v-bind="attrs" v-on="on">
              <v-icon large color="white">mdi-menu</v-icon>
            </v-btn>
          </template>

          <v-list>
            <v-list-item
              v-for="(menu, i) in menuList"
              :key="i"
              @click="authAction(i)"
            >
              <v-list-item-title>{{ menu }}</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
      </div>

      <div class="d-flex flex-row justify-space-between header-subtitle">
        <h4 class="subtitle">気になることをみんなの投票で決めよう！</h4>
        <SearchBar />
      </div>
    </header>

    <v-main>
      <v-container fluid>
        <Nuxt />

        <!-- use the modal component, pass in the prop -->
        <Teleport to="body">
          <modal :show="$store.state.show_modal" @close="updateShowModal">
            <template #header>
              <h3>ログインのお願い</h3>
            </template>
          </modal>
        </Teleport>
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

    <v-footer :absolute="!fixed" app color="amber" dark>
      <span class="footer-text"
        >DemocraticVoting.com &copy; {{ new Date().getFullYear() }}</span
      >
    </v-footer>
  </v-app>
</template>

<script>
import firebase from "@/plugins/firebase"
import SearchBar from '@/components/SearchBar.vue'
import Modal from "@/components/Modal.vue"

export default {
  name: "DefaultLayout",
  components: {
    SearchBar,
    Modal,
  },
  data() {
    return {
      menuList: ["ログイン", "ログアウト"],
      // pathList: ["/user-setting", "/login"],
    };
  },
  methods: {
    moveTop() {
      document.body.scrollTop = 0; // For Safari
      document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    },
    authAction(i) {
      if (i === 0) {
        // login
        window.location.replace("/login");
      } else {
        // logout
        const agreement = confirm("ログアウトしてよろしいですか？");
        if (agreement) {
          firebase.auth().signOut()
        }
      }
    },
    async updateShowModal() {
      await this.$store.commit('updateShowModal', false)
    },
  },
};
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
a {
  text-decoration: none;
}
.invalid-user {
  margin-top: 1rem;
}
.subtitle {
  @extend %subtitle;
}
</style>
