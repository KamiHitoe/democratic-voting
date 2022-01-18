<template>
  <section>
    <h4 class="subtitle">気になることを聞いてみよう！</h4>
    <form id="topics-form" @submit.prevent="submit">
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
              data-vv-name="select"
              required
            ></v-select>
          </v-col>
          <v-col cols="3">
            <v-select
              v-model="sex"
              :items="sexItems"
              label="性別"
              color="amber"
              data-vv-name="select"
              required
            ></v-select>
          </v-col>
          <v-col cols="3">
            <v-select
              v-model="age"
              :items="ageItems"
              label="年代"
              color="amber"
              data-vv-name="select"
              required
            ></v-select>
          </v-col>
        </v-row>

        <v-textarea
          class="md-6"
          v-model="description"
          auto-grow
          filled
          color="amber"
          label="内容説明"
          rows="1"
        ></v-textarea>

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
          class="mr-4"
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
      age: 0,
      description: '',
      option_1: '',
      option_2: '',
      option_3: '',
      option_4: '',
      categoryItems: ['恋愛', 'アニメ', '趣味'],
      sexItems: ['男性', '女性'],
      ageItems: [10, 20, 30],
    }
  },
})
</script>

<style lang="scss" scoped>
section {
  @extend %section-body;
  .subtitle {
    @extend %subtitle;
  }
}
</style>
