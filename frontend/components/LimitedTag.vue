<template>
  <div class="limited-vote d-flex flex-row">
    <h5 v-if="topic.sex === 'male'" :class="tag_class">男性限定投票</h5>
    <h5 v-else-if="topic.sex === 'female'" :class="tag_class">女性限定投票</h5>
    <h5 v-if="topic.age" :class="tag_class">{{ topic.age }}代限定投票</h5>
  </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  props: {
    topic: Object,
    tag_class: String,
  },
  data() {
    return {
      sex: null,
    };
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
