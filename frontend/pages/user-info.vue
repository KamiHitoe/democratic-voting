<template>
  <section v-if=user>
    <h4 class="subtitle">ユーザー情報</h4>
    <p>性別: {{ user.sex }}</p>
    <p>年代: {{ user.age }}代</p>
  </section>
  <div v-else>
    <p>ユーザー情報が登録されていません</p>
    <p>ログインしてユーザー情報を登録してください</p>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import global from "@/mixins/global";

export default Vue.extend({
  mixins: [
    global,
  ],
  created() {
    this.getUser();
  },
});
</script>

<style lang="scss" scoped>
section {
  text-align: center;
  @extend %section-body;
}
</style>
