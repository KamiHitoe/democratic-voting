<template>
  <div class="limited-vote d-flex flex-row">
    <h5 v-if="topics.sex" :class="tag_class">{{ topics.sex }}限定投票</h5>
    <h5 v-if="topics.age" :class="tag_class">{{ topics.age }}代限定投票</h5>
  </div>

</template>

<script>
import Vue from 'vue'

export default Vue.extend({
  props: {
    topics: Object,
    tag_class: String,
  },
  data() {
    return {
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

