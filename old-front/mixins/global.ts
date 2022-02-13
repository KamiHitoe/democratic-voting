import Vue, { PropType } from "vue"
import firebase from "@/plugins/firebase"
import { User } from "@/types"

export default Vue.extend({
  data() {
    return {
      user: {} as User,
      firebase_user: {} as Object,
      user_existed: null as Boolean,
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
              this.user_existed = true
            } else {
              // uid未登録の場合
              this.firebase_user = user
              console.log('uid is not registered')
              this.user_existed = false
              // throw new Error('uid is not registered')
            }
          })
        } else {
          // firebase Authに登録されていない場合
          console.log('user is not registered')
          // throw new Error('user is not registered')
        }
        this.user_existed = false
      })
    },
  }
});
