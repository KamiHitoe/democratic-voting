<template>
  <section class="vote-contents">
    <h4 class="subtitle">
      トップ　＞　{{ category }}
    </h4>
    <v-divider></v-divider>
    <LimitedTag :topics="topics" tag_class="limited-tag" />
    <nuxt-link class="vote-body d-flex flex-row" :to="`/topics/${topics.id}`">
      <img class="topics-img" :src="topics.img_path" />
      <div class="topics-contents d-flex flex-column">
        <div class="d-flex flex-row">
          <p class="data-margin">{{ topics.voted_num }} votes</p>
          <p class="data-margin">{{ topics.timestamp }}</p>
          <p class="data-margin change-color">
            {{ category }}
          </p>
        </div>
        <h2 class="topics-title">{{ topics.title }}</h2>
      </div>
    </nuxt-link>
    <p class="topics-description">{{ topics.description }}</p>

    <div class="d-flex flex-row">
      <canvas id="result-chart"></canvas>
      <div class="d-flex flex-column justify-center">
        <p>
          <span class="chart-label-1">&nbsp;</span>{{ topics.option_1 }}
          {{ topics.option_1_num }}票
        </p>
        <p>
          <span class="chart-label-2">&nbsp;</span>{{ topics.option_2 }}
          {{ topics.option_2_num }}票
        </p>
        <p v-if="topics.option_3">
          <span class="chart-label-3">&nbsp;</span>{{ topics.option_3 }}
          {{ topics.option_3_num }}票
        </p>
        <p v-if="topics.option_4">
          <span class="chart-label-4">&nbsp;</span>{{ topics.option_4 }}
          {{ topics.option_4_num }}票
        </p>
      </div>
    </div>

    <div
      v-if="
        !$route.params.topic_id &&
        (!topics.sex || topics.sex == user.sex) &&
        (!topics.age || topics.age == user.age)
      "
    >
      <Voting :topics="topics" />
    </div>
    <p v-else class="invalid-user">
      ※この投稿の対象ユーザーではないため投票できません。
    </p>
  </section>
</template>

<script>
// import Vue from 'vue'
import Chart from "chart.js";
import Voting from "@/components/topics/Voting.vue";
import LimitedTag from "@/components/LimitedTag.vue";
import { categoryList } from "@/data";

export default {
  components: {
    Voting,
    LimitedTag,
  },
  props: {
    topics: Object,
    user: Object,
  },
  data() {
    return {
      categoryList: categoryList,
      chartPattern: 2,
      category: "",
    };
  },
  updated() {
    this.category = this.categoryList[this.topics.category_id - 1].category
    console.log(this.category)
    const ctx = document.getElementById("result-chart");
    // the number of options == 4
    if (this.topics.option_3 && this.topics.option_4) {
      new Chart(ctx, {
        type: "pie",
        data: {
          datasets: [
            {
              data: [
                this.topics.option_1_num,
                this.topics.option_2_num,
                this.topics.option_3_num,
                this.topics.option_4_num,
              ],
              backgroundColor: [
                "rgb(255, 99, 132)",
                "rgb(54, 162, 235)",
                "rgb(255, 205, 86)",
                "rgb(111, 205, 205)",
              ],
              hoverOffset: 4,
            },
          ],
        },
      });
      // the number of options == 3
    } else if (this.topics.option_3) {
      new Chart(ctx, {
        type: "pie",
        data: {
          datasets: [
            {
              data: [
                this.topics.option_1_num,
                this.topics.option_2_num,
                this.topics.option_3_num,
              ],
              backgroundColor: [
                "rgb(255, 99, 132)",
                "rgb(54, 162, 235)",
                "rgb(255, 205, 86)",
              ],
              hoverOffset: 4,
            },
          ],
        },
      });
      // the number of options == 2
    } else {
      new Chart(ctx, {
        type: "pie",
        data: {
          datasets: [
            {
              data: [this.topics.option_1_num, this.topics.option_2_num],
              backgroundColor: ["rgb(255, 99, 132)", "rgb(54, 162, 235)"],
              hoverOffset: 4,
            },
          ],
        },
      });
    }
  },
  methods: {
    async getVotedStatus() {
      const res = await this.$axios.get(
        `/votes/${this.user.id}/${this.topics.id}`
      );
      this.voted_status = res.data.voted_status;
      console.log(this.voted_status);
    },
  },
};
</script>

<style lang="scss" scoped>
.subtitle,
.topics-title,
.topics-description {
  text-align: left;
}
.change-color {
  color: $amber;
}
.vote-contents {
  padding: 1rem;
  background-color: #fff;
  text-align: center;
  .vote-body {
    margin-top: 1rem;
    color: $text;
  }
  .limited-box {
    background: #ff0556;
    color: #fff;
    margin: 1rem 1rem 0 0;
    padding: 0.2rem 1rem;
    border-radius: 0.3rem;
  }
  .topics-img {
    width: 100px;
    height: 100px;
    margin-right: 3rem;
  }
  .data-margin {
    margin-right: 1rem;
  }
  .topics-description {
    margin: 2rem 0;
  }
}
#result-chart {
  max-width: 70%;
  height: auto;
}
.chart-label-1,
.chart-label-2,
.chart-label-3,
.chart-label-4 {
  display: inline-block;
  width: 40px;
  margin-right: 10px;
}
.chart-label-1 {
  background: rgb(255, 99, 132);
}
.chart-label-2 {
  background: rgb(54, 162, 235);
}
.chart-label-3 {
  background: rgb(255, 205, 86);
}
.chart-label-4 {
  background: rgb(111, 205, 205);
}
</style>
