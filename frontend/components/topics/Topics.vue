<template>
  <section>
    <LimitedTag :topic="topic" tag_class="limited-tag-sm" />
    <nuxt-link
      class="contents"
      :to="`/topics/${topic.id}`"
      :topic_id="topic.id"
    >
      <img v-if="topic.img_path" class="topic-img" :src="topic.img_path" />
      <img v-else class="topic-img" src="https://test-democratic-img.s3.ap-northeast-1.amazonaws.com/no_image.png">
      <div class="topic-contents">
        <div class="topic-information">
          <div class="topic-data">
            <p class="topic-id data-margin">{{ order }}</p>
            <p class="topic-voted-num data-margin">
              {{ topic.voted_num }}投票
            </p>
            <p class="topic-timestamp data-margin">{{ topic.timestamp }}</p>
          </div>

          <p class="topic-category data-margin change-color">
            {{ categoryList[topic.category_id - 1].category }}
          </p>
        </div>

        <h4 class="topic-title">{{ topic.title }}</h4>
        <div class="topic-option-list">
          <h6 class="data-margin">{{ topic.option_1 }}</h6>
          <h6 class="data-margin">{{ topic.option_2 }}</h6>
          <h6 class="data-margin">{{ topic.option_3 }}</h6>
          <h6 class="data-margin">{{ topic.option_4 }}</h6>
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
    topic: { type: Object as PropType<Topic> },
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
@media (min-width: 600px) {
  .contents,
  .topic-information,
  .topic-data,
  .topic-option-list {
    display: flex;
  }
  .topic-img {
    margin-right: 3rem;
  }
}
@media (max-width: 600px) {
  .topic-data {
    display: flex;
  }
  .topic-contents {
    margin: 1rem 0;
  }
}
.contents {
  color: $text;
  margin-bottom: 1rem;
}
.change-color {
  color: $amber;
}
.data-margin {
  margin-right: 1rem;
}
.topic-img {
  width: 100px;
  height: 100px;
  object-fit: fill;
}
.topic-contents {
  text-align: left;
}
.topic-title {
  margin-bottom: 14px;
}
.topic-id {
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
