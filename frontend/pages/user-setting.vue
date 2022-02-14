<template>
  <section v-if="user_existed === false">
    <h4 class="subtitle">ユーザー情報を登録します</h4>
    <form id="user-form" action="#" @submit.prevent="submitUser">
      <v-container>
        <!-- <v-text-field
          v-model="username"
          label="ユーザーネーム"
          outlined
          dense
          color="amber"
          type="text"
          maxlength="100"
          required
        ></v-text-field> -->

        <v-row>
          <v-col cols="3">
            <label for="sex">性別</label>
            <select id="sex" v-model="sex">
              <option class="hidden" value="">性別</option>
              <option v-for="sex in sexItems" :value="sex.value">
                {{ sex.item }}
              </option>
            </select>
          </v-col>
          <v-col cols="3">
            <label for="age">年代</label>
            <select id="age" v-model="age">
              <option class="hidden" value="">年代</option>
              <option v-for="age in ageItems" :value="age.value">
                {{ age.item }}
              </option>
            </select>
          </v-col>
        </v-row>

        <p class="attention">※性別・年代を登録すると該当する投稿に投票・コメントすることができます</p>

        <v-btn class="submit-btn" color="amber" dark type="submit">
          ユーザー情報を登録する
        </v-btn>
      </v-container>
    </form>
  </section>
  <p v-else>ユーザー情報のご登録ありがとうございました</p>
</template>

<script lang="ts">
import Vue from "vue";
import global from "@/mixins";

export default Vue.extend({
  mixins: [
    global,
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
  created() {
    this.getUser();
  },
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
</style>
