import Vue from "vue"

export default Vue.extend({
  data() {
    return {
      // foo: 0 as Number,
    };
  },
  methods: {
    async updateShowModal(): Promise<void> {
      await this.$store.commit('updateShowModal', true)
      console.log(this.$store.state.show_modal)
    },
  }
});
