<template>
  <v-row>
    <v-col cols="3">
      <v-select
        v-model="sex"
        :items="sexItems"
        label="性別"
        item-color="amber"
        solo
        dense
        background-color="amber lighten-4"
      ></v-select>
    </v-col>
    <v-col cols="3">
      <v-select
        v-model="age"
        :items="ageItems"
        label="年代"
        item-color="amber"
        solo
        dense
        background-color="amber lighten-4"
      ></v-select>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  data() {
    return {
      sexItems: [
        {text: "なし", value: null},
        {text: "男性", value: "male"},
        {text: "女性", value: "female"},
      ] as Object[],
      ageItems: [
        {text: "なし", value: null},
        {text: "10代", value: 10},
        {text: "20代", value: 20},
        {text: "30代", value: 30},
        {text: "40代", value: 40},
        {text: "50代", value: 50},
      ] as Object[],
      sex: "" as String,
      age: 0 as Number,
    };
  },
  methods: {

  },
});
</script>

<style lang="scss" scoped>
.limited-tag,
.limited-tag-sm {
  background: #ff0556;
  color: #fff;
  border-radius: 0.3rem;
  padding: 0.2rem 1rem;
  font-weight: normal;
  margin: 0 1rem 1rem 0;
}
.limited-tag {
  font-size: 14px;
  margin: 1rem 1rem 0 0;
}
</style>
