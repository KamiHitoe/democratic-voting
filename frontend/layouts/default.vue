<template>
  <v-app>
    <header>
      <div class="d-flex flex-row justify-space-between amber">
        <nuxt-link class="header-title d-flex flex-row" to="/">
          <h1>みんなの投票箱</h1>
          <v-icon color="white" large>mdi-mailbox</v-icon>
        </nuxt-link>
        <v-menu class="menu">
          <template #activator="{ on, attrs }">
            <v-btn icon v-bind="attrs" v-on="on">
              <v-icon class="menu-icon" large color="white">mdi-menu</v-icon>
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
      <v-icon large color="white">mdi-chevron-up</v-icon>
    </v-btn>

    <!-- <v-footer :absolute="!fixed" app color="amber" dark> -->
    <v-footer class="d-flex flex-column" color="amber">
      <nuxt-link to="/information/terms">
        <v-btn color="white" text>利用規約</v-btn>
      </nuxt-link>
      <nuxt-link to="/information/contact">
        <v-btn color="white" text>お問い合せ</v-btn>
      </nuxt-link>
      <span class="footer-content"
        >&copy; {{ new Date().getFullYear() }} みんなの投票箱</span
      >

    </v-footer>
  </v-app>
</template>

<script lang="ts">
import Vue from "vue";
import firebase from "@/plugins/firebase"
import SearchBar from '@/components/default/SearchBar.vue'
import Modal from "@/components/default/Modal.vue"

export default Vue.extend({
  name: "DefaultLayout",
  components: {
    SearchBar,
    Modal,
  },
  data() {
    return {
      menuList: ["ログイン", "ユーザー情報確認", "ログアウト"],
    };
  },
  methods: {
    moveTop() {
      document.body.scrollTop = 0; // For Safari
      document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    },
    authAction(i: number) {
      if (i === 0) {
        // login
        window.location.replace("/login");
      } else if (i === 1) {
        window.location.replace("/user-info");
      } else {
        // logout
        // login済か確認
        firebase.auth().onAuthStateChanged((user) => {
          if (user) {
            const uid: string = user.uid;
            this.$axios.get(`/users?uid=${uid}`)
            .then((res) => {
              if (res.data) {
                const agreement: boolean = confirm("ログアウトしてよろしいですか？");
                if (agreement) {
                  firebase.auth().signOut()
                  window.location.replace("/");
                }
              } else {
                // uid未登録の場合
                window.alert('ユーザ情報登録が完了していません')
              }
            })
          } else {
            // firebase Authに登録されていない場合
            // window.alert('まだログインしていません')
          }
        })
      }
    },
    async updateShowModal() {
      await this.$store.commit('updateShowModal', false)
    },
  },
});
</script>

<style lang="scss">
.v-application--wrap {
  background-color: $amber-lighten-5;
}
.menu-icon {
  margin: 1rem 1rem 0 0;
}
header {
  .header-title {
    margin-bottom: 0.3rem;
    text-decoration: none;
    h1 {
      color: #fff;
      margin-left: 0.5rem;
    }
  }
  .subtitle {
    margin-top: 0.3rem;
  }
}
.header-subtitle {
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
  @extend %scarlet-subtitle;
}
.twitter-share-button {
  max-width: 100px;
}
.footer-content {
  margin: 0.3rem 0 0.5rem 0;
  color: #fff;
  font-size: 14px;
}
</style>
