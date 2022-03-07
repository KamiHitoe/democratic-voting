<template>
  <section v-if="user_existed === false">
    <h4 class="subtitle">ユーザー情報を登録します</h4>
    <form id="user-form" action="#" @submit.prevent="submitUser">
      <div class="grid-container">

        <div class="grid-item">
          <label for="sex">性別</label>
          <select id="sex" v-model="sex">
            <option class="hidden" value="">性別</option>
            <option v-for="sex in sexItems" :value="sex.value">
              {{ sex.item }}
            </option>
          </select>
        </div>
        <div class="grid-item">
          <label for="age">年代</label>
          <select id="age" v-model="age">
            <option class="hidden" value="">年代</option>
            <option v-for="age in ageItems" :value="age.value">
              {{ age.item }}
            </option>
          </select>
        </div>

      </div>
        <p class="attention">※性別・年代を登録すると該当する投稿に投票・コメントすることができます</p>

        <v-btn class="submit-btn" color="amber" dark type="submit">
          ユーザー情報を登録する
        </v-btn>
    </form>
  </section>
  <p v-else>ユーザー情報のご登録ありがとうございました</p>
</template>

<script lang="ts">
import Vue from "vue";
import mixins from "vue-typed-mixins";
import getUser from "@/mixins/getUser";

export default mixins(getUser).extend({
// export default Vue.extend({
  mixins: [
    getUser,
  ],
  computed: {
    uid() {
      return this.firebase_user.uid
    },
  },
  data() {
    return {
      // username: null as String,
      // uid: null as String,
      sex: null as String,
      age: null as Number,
      sexItems: [
        { value: "male", item: "男性" },
        { value: "female", item: "女性" },
      ],
      ageItems: [
        { value: 10, item: "10代" },
        { value: 20, item: "20代" },
        { value: 30, item: "30代" },
        { value: 40, item: "40代" },
        { value: 50, item: "50代" },
      ],
    };
  },
  // created() {
  //   this.getUser();
  // },
  methods: {
    async submitUser() {
      await this.$axios.post("/users", {
        // username: this.username,
        uid: this.uid,
        sex: this.sex,
        age: this.age,
      })
      window.location.replace("/");
      // console.log(this.uid, this.sex, this.age)
    },
  },
});
</script>

<style lang="scss" scoped>
section {
  text-align: center;
  @extend %section-body;
  .submit-btn {
    margin-top: 1rem;
  }
}
select {
  @extend %select-validation;
}
label {
  color: $gray;
  float: left;
}
@media (min-width: 600px) {
  .grid-container {
    display: grid;
    grid-template-columns: 30% 30%;
  }
}
.grid-item {
  max-width: 200px;
  margin: 1rem 0;
}
</style>
