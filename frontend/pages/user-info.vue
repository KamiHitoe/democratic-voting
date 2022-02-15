<template>
  <section v-if=user_existed>
    <h4 class="subtitle">ユーザー情報</h4>
    <p>性別: {{ sex }}</p>
    <p>年代: {{ user.age }}代</p>
  </section>
  <div v-else>
    <p>ユーザー情報が登録されていません</p>
    <p>ログインしてユーザー情報を登録してください</p>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import getUser from "@/mixins/getUser";

export default Vue.extend({
  mixins: [
    getUser,
  ],
  data() {
    return {
      sex: null,
    }
  },
  watch: {
    user() {
      if (this.user.sex === "male") {
        this.sex = "男性"
      } else if (this.user.sex === "female") {
        this.sex = "女性"
      }
    }
  },
  // created() {
  //   this.getUser();
  // },
});
</script>

<style lang="scss" scoped>
section {
  text-align: center;
  @extend %section-body;
}
</style>
