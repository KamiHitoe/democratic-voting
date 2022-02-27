import Vue from "vue"

export default Vue.extend({
  data() {
    return {
    };
  },
  methods: {
    async updateShowModal(): Any {
      await this.$store.commit('updateShowModal', true)
      console.log(this.$store.state.show_modal)
    },
  }
});
