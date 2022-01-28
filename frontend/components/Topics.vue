<template>
  <section>
    <nuxt-link
      class="contents d-flex flex-row"
      :to="`/topics/${topics.id}`"
      :topic_id="topics.id"
    >
      <img class="topics-img" :src="topics.img_path" />
      <div class="topics-contents d-flex flex-column">
        <div class="d-flex flex-row">
          <p class="id data-margin">{{ order }}</p>
          <p class="data-margin">
            {{
              topics.option_1_num +
              topics.option_2_num +
              topics.option_3_num +
              topics.option_4_num
            }}
            votes
          </p>
          <p class="data-margin">{{ topics.timestamp }}</p>
          <p class="data-margin change-color">
            {{ categoryList[topics.category_id].category }}
          </p>
        </div>
        <h4 class="topics-title">{{ topics.title }}</h4>
        <div class="d-flex flex-row">
          <h6 class="data-margin">{{ topics.option_1 }}</h6>
          <h6 class="data-margin">{{ topics.option_2 }}</h6>
          <h6 class="data-margin">{{ topics.option_3 }}</h6>
          <h6 class="data-margin">{{ topics.option_4 }}</h6>
        </div>
      </div>
    </nuxt-link>
    <v-divider></v-divider>
  </section>
</template>

<script lang="ts">
import Vue from "vue";
import { categoryList } from "@/data/data";

export default Vue.extend({
  props: {
    topics: Object,
    order: Number,
  },
  data() {
    return {
      categoryList,
    };
  },
});
</script>

<style lang="scss" scoped>
.contents {
  @extend %section-body;
  margin-top: 0;
  color: #212121;
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
