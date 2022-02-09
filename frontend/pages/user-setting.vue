<template>
  <section>
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
</template>

<script lang="ts">
import Vue from "vue";
import firebase from "@/plugins/firebase";

export default Vue.extend({
  data() {
    return {
      // username: null as string,
      sex: null as string,
      age: null as number,
      sexItems: [
        { value: "男性", item: "男性" },
        { value: "女性", item: "女性" },
      ],
      ageItems: [
        { value: 10, item: "～20歳" },
        { value: 20, item: "20歳～" },
        { value: 30, item: "30歳～" },
        { value: 40, item: "40歳～" },
        { value: 50, item: "50歳～" },
      ],
    };
  },
  methods: {
    async submitUser() {
      const userForm: any = document.getElementById("user-form");
      const userInputs: any = userForm.elements;
      for (const e of userInputs) {
        // console.log(e);
        console.log(e.value);
      }

      firebase.auth().onAuthStateChanged((user) => {
        if (user) {
          // if user in Postgre is not found

          this.$axios.post("/users", {
            uid: user.uid,
          // username: this.username,
            sex: this.sex,
            age: this.age,
          }).then(() => {
            alert("post user success!");
            window.location.replace("/");
            console.log(user)
          })

          // else user already exist

        } else {
          // User is signed out
          console.log('User is signed out');
        }
      })
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
