import Vue, { PropType } from "vue"
import firebase from "@/plugins/firebase"
import { User } from "@/types"

export default Vue.extend({
  data() {
    return {
      user: {} as User,
    };
  },
  async created() {
    await this.getUser()
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
              throw new Error('uid is not registered')
            }
          })
        } else {
          // firebase Authに登録されていない場合
          console.log('user is not registered')
          throw new Error('user is not registered')
        }
      })
    },
  }
});
