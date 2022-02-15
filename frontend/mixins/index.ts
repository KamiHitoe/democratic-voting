import Vue from "vue"

export default Vue.extend({
  data() {
    return {
    };
  },
  methods: {
    async updateShowModal() {
      await this.$store.commit('updateShowModal', true)
      console.log(this.$store.state.show_modal)
    },
  }
});
