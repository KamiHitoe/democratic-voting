<template>
  <section>
    <LimitedTag :topics="topics" tag_class="limited-tag-sm" />
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
            {{ topics.voted_num }} votes
          </p>
          <p class="data-margin">{{ topics.timestamp }}</p>
          <p class="data-margin change-color">
            {{ categoryList[topics.category_id - 1].category }}
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
import Vue, { PropType } from "vue";
import LimitedTag from "@/components/LimitedTag.vue";
import { Topic, Category } from "@/types";
import { categoryList } from "@/data";

export default Vue.extend({
  components: {
    LimitedTag,
  },
  props: {
    topics: { type: Object as PropType<Topic> },
    order: { type: Number },
  },
  data() {
    return {
      categoryList: categoryList as Category[],
    };
  },
});
</script>

<style lang="scss" scoped>
section {
  @extend %section-body;
  margin-top: 0;
}
.contents {
  color: $text;
  margin-bottom: 1rem;
}
.change-color {
  color: $amber;
}
.topics-img {
  width: 100px;
  height: 100px;
  margin-right: 3rem;
  object-fit: fill;
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
.limited-tag {
  font-size: 8px;
}
</style>
