<template>
  <section>
    <h4 class="subtitle">気になることを聞いてみよう！</h4>
    <form id="topics-form" ref="form" @submit.prevent="submit">
      <v-container>

        <v-text-field
          v-model="title"
          label="タイトル"
          outlined
          dense
          color="amber"
          type="text"
          required
        ></v-text-field>
        
        <v-row>
          <v-col cols="3">
            <v-select
              v-model="category"
              :items="categoryItems"
              label="カテゴリー"
              color="amber"
              item-value=null
              :rules="[(v) => !!v || 'Item is required']"
              required
            ></v-select>
          </v-col>
          <v-col cols="3">
            <v-select
              v-model="sex"
              :items="sexItems"
              label="性別の特定"
              color="amber"
              data-vv-name="select"
              required
            ></v-select>
          </v-col>
          <v-col cols="3">
            <v-select
              v-model="age"
              :items="ageItems"
              label="年代の特定"
              color="amber"
              data-vv-name="select"
              required
            ></v-select>
          </v-col>
        </v-row>

        <v-row>
          <v-col>
              <v-file-input
                label="画像を選択"
                prepend-icon="mdi-camera"
              ></v-file-input>
          </v-col>
          <v-col>
            <v-textarea
              class=""
              v-model="description"
              auto-grow
              color="amber"
              label="内容説明"
              rows="5"
              required
            ></v-textarea>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="3">
            <v-text-field
              v-model="option_1"
              label="候補１"
              outlined
              dense
              color="amber"
              type="text"
              required
            ></v-text-field>
          </v-col>
          <v-col cols="3">
            <v-text-field
              v-model="option_2"
              label="候補２"
              outlined
              dense
              color="amber"
              type="text"
              required
            ></v-text-field>
          </v-col>
          <v-col cols="3">
            <v-text-field
              v-model="option_3"
              label="候補３"
              outlined
              dense
              color="amber"
              type="text"
            ></v-text-field>
          </v-col>
          <v-col cols="3">
            <v-text-field
              v-model="option_4"
              label="候補４"
              outlined
              dense
              color="amber"
              type="text"
            ></v-text-field>
          </v-col>
        </v-row>

        <v-btn
          class="submit-btn"
          color="amber"
          dark
          type="submit"
        >
          お題を作成する
        </v-btn>
      </v-container>

    </form>

  </section>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      title: '',
      category: '',
      sex: '',
      age: '',
      description: '',
      option_1: '',
      option_2: '',
      option_3: '',
      option_4: '',
      categoryItems: ['恋愛', 'アニメ', '趣味'],
      sexItems: ['なし', '男性', '女性'],
      ageItems: ['なし', '10代', '20代', '30代'],
      categoryRules: [v => !!v || 'this item is required'],
    }
  },
  methods: {
    submit() {
      this.$refs.form[0].validate();
      const topicsInputs = document.getElementById('topics-form').elements;
      for (let e of topicsInputs) {
        console.log(e);
        console.log(!!e);
        console.log(e.value);
      }
    }
  }
})
</script>

<style lang="scss" scoped>
section {
  text-align: center;
  @extend %section-body;
  .subtitle {
    @extend %subtitle;
  }
}
</style>
