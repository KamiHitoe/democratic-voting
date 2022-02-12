import firebase from "@/plugins/firebase"
import { initialUser } from "@/data";

export default {
  data() {
    return {
      user: initialUser,
    }
  },
  methods: {
    async updateShowModal() {
      await this.$store.commit('updateShowModal', true)
      console.log(this.$store.state.show_modal)
    },
    async getUser() {
      firebase.auth().onAuthStateChanged((user) => {
        if (user) {
          const uid = user.uid;
          this.$axios.get(`/users?uid=${uid}`)
          .then((res) => {
            if (res.data) {
              this.user = res.data
              console.log(this.user)
            } else {
              // uid未登録の場合
              console.log('uid is not registered')
            }
          })
        } else {
          // firebase Authに登録されていない場合
          console.log('user is not registered')
        }
      })
    },
  }
};
