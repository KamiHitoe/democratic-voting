<template>
  <section>
    <div class="contents d-flex flex-row">
      <img class="topics-img" :src="topics.img_path">
      <div class="topics-contents d-flex flex-column">
        <div class="d-flex flex-row">
          <p class="id data-margin">{{ topics.id }}</p>
          <p class="data-margin">{{ topics.comments }} comments</p>
          <p class="data-margin">{{ topics.created_at }}</p>
          <p class="data-margin change-color">{{ topics.category }}</p>
        </div>
        <h4 class="topics-title">{{ topics.title }}</h4>
        <div class="d-flex flex-row">
          <h6 class="data-margin" v-for="(option, i) in topics.optionList" :key="i">
            {{ option }}
          </h6>
        </div>
      </div>
    </div>
    <v-divider></v-divider>
  </section>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
    }
  },
  props: {
    topics: Object,
  }
})
</script>

<style lang="scss" scoped>
.contents {
  @extend %section-body;
  margin-top: 0;
}
.change-color {
  color: $amber;
}
.topics-img {
  width: 100px;
  height: 100px;
  margin-right: 3rem;
}
.topics-contents {
  text-align: left;
}
.topics-title {
  margin-bottom: 14px;
}
.data-margin {
  margin-right: 1rem;
}
.id {
  color: #fff;
  background-color: $amber;
  width: 22px;
  height: 22px;
  text-align: center;
}
</style>
