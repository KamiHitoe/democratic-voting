<template>
  <section>
    <h4 class="subtitle">気になることを聞いてみよう！</h4>
    <form id="topics-form" action="#" @submit.prevent="submitTopics">
      <v-text-field
        v-model="title"
        label="タイトル"
        outlined
        dense
        color="amber"
        type="text"
        maxlength="100"
        required
      ></v-text-field>

      <div class="grid-container-category">
        <div class="grid-item">
          <label for="category">カテゴリー</label>
          <select id="category" v-model="category_id" required>
            <option class="hidden" value="">カテゴリー</option>
            <option v-for="category in categoryList" :value="category.id">
              {{ category.category }}
            </option>
          </select>
        </div>
        <div class="grid-item">
          <label for="sex">性別の特定</label>
          <select id="sex" v-model="sex">
            <option class="hidden" value="">性別の特定</option>
            <option v-for="sex in sexItems" :value="sex.value">
              {{ sex.item }}
            </option>
          </select>
        </div>
        <div class="grid-item">
          <label for="age">年代の特定</label>
          <select id="age" v-model="age">
            <option class="hidden" value="">年代の特定</option>
            <option v-for="age in ageItems" :value="age.value">
              {{ age.item }}
            </option>
          </select>
        </div>
      </div>

      <div class="grid-container-description">
        <v-file-input
          color="amber"
          label="画像を選択"
          prepend-icon="mdi-camera"
          id="fileUpload"
        ></v-file-input>
        <v-textarea
          v-model="description"
          class=""
          auto-grow
          color="amber"
          label="内容説明"
          rows="5"
          max-length="500"
          required
        ></v-textarea>
      </div>

      <div class="grid-container-option">
        <v-text-field
          v-model="option_1"
          label="候補１"
          outlined
          dense
          color="amber"
          type="text"
          max-length="100"
          required
        ></v-text-field>
        <v-text-field
          v-model="option_2"
          label="候補２"
          outlined
          dense
          color="amber"
          type="text"
          max-length="100"
          required
        ></v-text-field>
        <v-text-field
          v-model="option_3"
          label="候補３"
          outlined
          dense
          color="amber"
          type="text"
          max-length="100"
        ></v-text-field>
        <v-text-field
          v-model="option_4"
          label="候補４"
          outlined
          dense
          color="amber"
          type="text"
          max-length="100"
        ></v-text-field>
      </div>

      <v-btn class="submit-btn" color="amber" dark type="submit">
        お題を作成する
      </v-btn>
    </form>
  </section>
</template>

<script lang="ts">
import Vue from "vue";
import { Category } from "@/types";
import { categoryList } from "@/data";
import AWS from 'aws-sdk';
import { PutObjectRequest } from "aws-sdk/clients/s3";

export default Vue.extend({
  data() {
    return {
      title: null as string,
      category_id: null as number,
      sex: null as string,
      age: null as number,
      description: null as string,
      option_1: null as string,
      option_2: null as string,
      option_3: null as string,
      option_4: null as string,
      sexItems: [
        { value: null, item: "なし" },
        { value: "male", item: "男性" },
        { value: "female", item: "女性" },
      ],
      ageItems: [
        { value: null, item: "なし" },
        { value: 10, item: "10代" },
        { value: 20, item: "20代" },
        { value: 30, item: "30代" },
        { value: 40, item: "40代" },
        { value: 50, item: "50代" },
      ],
      fileURL: null as any,
      categoryList: categoryList as Category[],
    };
  },
  methods: {
    async submitTopics() {
      await this.s3upload();
      await setTimeout(() => console.log('wait'), 1000);
      const topicsForm: any = document.getElementById("topics-form");
      const topicsInputs: any = topicsForm.elements;
      for (const e of topicsInputs) {
        // console.log(e);
        console.log(e.value);
      }
      console.log(this.title, this.description, this.option_1);
      await this.$axios.post("/topics", {
        user_id: 1,
        category_id: this.category_id,
        title: this.title,
        description: this.description,
        option_1: this.option_1,
        option_2: this.option_2,
        option_3: this.option_3,
        option_4: this.option_4,
        sex: this.sex,
        age: this.age,
        img_path: this.fileURL,
      });
      console.log("post topic success!");
      window.location.replace("/");
    },
    s3upload() {
      const bucketName = 'test-democratic-img';
      const region = 'ap-northeast-1';

      // const myCredentials = new AWS.CognitoIdentityCredentials({
      //   IdentityPoolId: process.env.IDENTITY_POOL_ID,
      // });
      // const myConfig = new AWS.Config({
      //   credentials: myCredentials,
      //   region: region,
      // });
      // AWS.config = myConfig;

      AWS.config.update({
        accessKeyId: process.env.ACCESS_KEY_ID,
        secretAccessKey: process.env.SECRET_ACCESS_KEY,
      })

      const s3 = new AWS.S3({
        params: { Bucket: bucketName },
        region: region,
      })

      const files = (<HTMLInputElement>document.getElementById('fileUpload')).files;

      if (files[0]) {
        const file = files[0];
        const fileName = file.name;
        this.fileURL = `https://${bucketName}.s3.${region}.amazonaws.com/${fileName}`
        console.log(this.fileURL);

        s3.putObject({
          Key: fileName,
          Body: file,
          ACL: 'public-read',
        } as any, function (err, data) {
          if (err) {
            return alert(err.message);
          }
          console.log('success!');
        })
      }
    },
  },
});
</script>

<style lang="scss" scoped>
section {
  text-align: center;
  @extend %section-body;
  .subtitle {
    @extend %subtitle;
  }
}
select {
  @extend %select-validation;
}
form {
  margin-top: 1rem;
}
label {
  color: $gray;
  float: left;
}
@media (min-width: 600px) {
  .grid-container-category {
    display:grid;
    grid-template-columns: repeat(3, auto);
    grid-gap: 2rem;
  }
  .grid-container-description {
    display:grid;
    grid-template-columns: repeat(2, auto);
    grid-gap: 5rem;
  }
  .grid-container-option {
    display:grid;
    grid-template-columns: repeat(4, auto);
    grid-gap: 1rem;
  }
}
@media (max-width: 600px) {
  .grid-item {
    margin: 1rem 0;
  }
}
</style>
