<template>
  <section>
    <h4 class="subtitle">気になることを聞いてみよう！</h4>
    <form id="topics-form" action="#" @submit.prevent="submitTopics">
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
            <select v-model="category_id" required>
              <option class="hidden" value="">カテゴリー</option>
              <option v-for="category in CategoryList" v-bind:value="category.id">
                {{ category.category }}
              </option>
            </select>
          </v-col>
          <v-col cols="3">
            <select v-model="sex">
              <option class="hidden" value="">性別の特定</option>
              <option v-for="sex in sexItems" v-bind:value="sex.value">
                {{ sex.item }}
              </option>
            </select>
          </v-col>
          <v-col cols="3">
            <select v-model="age">
              <option class="hidden" value="">年代の特定</option>
              <option v-for="age in ageItems" v-bind:value="age.value">
                {{ age.item }}
              </option>
            </select>
          </v-col>
        </v-row>

        <v-row>
          <v-col>
              <v-file-input
                color="amber"
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
import { CategoryList } from '../data/data'

export default Vue.extend({
  data() {
    return {
      title: null,
      category_id: null,
      sex: null,
      age: null,
      description: null,
      option_1: null,
      option_2: null,
      option_3: null,
      option_4: null,
      sexItems: [
        { value: null, item: 'なし' },
        { value: false, item: '男性' },
        { value: true, item: '女性' },
      ],
      ageItems: [
        { value: null, item: 'なし' },
        { value: 10, item: '10代' },
        { value: 20, item: '20代' },
        { value: 30, item: '30代' },
      ],
    }
  },
  computed: {
    CategoryList: () => {
      CategoryList.shift()
      return CategoryList
    },
  },
  methods: {
    submitTopics() {
      const topicsInputs = document.getElementById('topics-form').elements;
      for (let e of topicsInputs) {
        // console.log(e);
        console.log(e.value);
      }
      console.log(this.title, this.description, this.option_1, this.category);
      this.$axios.post('/topics', {
        user_id: 1,
        category_id: this.category_id,
        title: this.title,
        description: this.description,
        option_1: this.option_1,
        option_2: this.option_2,
        option_3: this.option_3,
        option_4: this.option_4,
        option_1_num: 0,
        option_2_num: 0,
        option_3_num: 0,
        option_4_num: 0,
      })
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

select {
	@extend %select-validation;
}
label {
  color: $gray;
  float: left;
}
</style>
