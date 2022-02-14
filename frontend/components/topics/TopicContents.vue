<template>
  <section class="vote-contents">
    <h4 class="subtitle">
      <nuxt-link class="change-color" to="/">トップ</nuxt-link>
      <span class="plain-text">　＞　</span>
      <a class="change-color" :href="`/search?category_id=${topic.category_id}`">{{ category }}</a>
    </h4>
    <v-divider></v-divider>
    <LimitedTag :topic="topic" tag_class="limited-tag" />
    <nuxt-link class="vote-body d-flex flex-row" :to="`/topics/${topic.id}`">
      <img class="topic-img" :src="topic.img_path" />
      <div class="topic-contents d-flex flex-column">
        <div class="d-flex flex-row">
          <p class="data-margin">{{ topic.voted_num }} votes</p>
          <p class="data-margin">{{ topic.timestamp }}</p>
          <Report class="data-margin" :user="user" :topic="topic" />
          <p class="data-margin change-color">
            {{ category }}
          </p>
        </div>
        <h2 class="topic-title">{{ topic.title }}</h2>
      </div>
    </nuxt-link>
    <p class="topic-description">{{ topic.description }}</p>

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
          @change="getLimitedVote"
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
          @change="getLimitedVote"
        ></v-select>
      </v-col>
    </v-row>

    <div class="d-flex flex-row">
      <canvas id="result-chart"></canvas>
      <div class="d-flex flex-column justify-center">
        <p>
          <span class="chart-label-1">&nbsp;</span>{{ topic.option_1 }}
          {{ topic.option_1_num }}票
        </p>
        <p>
          <span class="chart-label-2">&nbsp;</span>{{ topic.option_2 }}
          {{ topic.option_2_num }}票
        </p>
        <p v-if="topic.option_3">
          <span class="chart-label-3">&nbsp;</span>{{ topic.option_3 }}
          {{ topic.option_3_num }}票
        </p>
        <p v-if="topic.option_4">
          <span class="chart-label-4">&nbsp;</span>{{ topic.option_4 }}
          {{ topic.option_4_num }}票
        </p>
      </div>
    </div>

    <div
      v-if="
        !$route.params.topic_id &&
        (!topic.sex || topic.sex == user.sex) &&
        (!topic.age || topic.age == user.age)
      "
    >
      <Voting :user="user" :topic="topic" />
    </div>
    <div v-else-if="$route.params.topic_id"></div>
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
import Report from "@/components/default/Report.vue";
import { categoryList } from "@/data";

export default {
  components: {
    Voting,
    LimitedTag,
    Report,
  },
  props: {
    user: Object,
    topic: Object,
  },
  data() {
    return {
      categoryList: categoryList,
      chartPattern: 2,
      category: "",
      sexItems: [
        {text: "なし", value: null},
        {text: "男性", value: "male"},
        {text: "女性", value: "female"},
      ],
      ageItems: [
        {text: "なし", value: null},
        {text: "10代", value: 10},
        {text: "20代", value: 20},
        {text: "30代", value: 30},
        {text: "40代", value: 40},
        {text: "50代", value: 50},
      ],
      sex: "",
      age: 0,
    };
  },
  watch: {
    topic() {
      this.category = this.categoryList[this.topic.category_id - 1].category
    }
  },
  updated() {
    // this.category = this.categoryList[this.topic.category_id - 1].category
    console.log(this.category)
    const ctx = document.getElementById("result-chart");
    // the number of options == 4
    if (this.topic.option_3 && this.topic.option_4) {
      new Chart(ctx, {
        type: "pie",
        data: {
          datasets: [
            {
              data: [
                this.topic.option_1_num,
                this.topic.option_2_num,
                this.topic.option_3_num,
                this.topic.option_4_num,
              ],
              backgroundColor: [
                "rgb(255, 99, 132)",
                "rgb(54, 162, 235)",
                "rgb(255, 205, 86)",
                "rgb(111, 205, 205)",
              ],
            },
          ],
        },
        options: {
          events: []
        },
      });
      // the number of options == 3
    } else if (this.topic.option_3) {
      new Chart(ctx, {
        type: "pie",
        data: {
          datasets: [
            {
              data: [
                this.topic.option_1_num,
                this.topic.option_2_num,
                this.topic.option_3_num,
              ],
              backgroundColor: [
                "rgb(255, 99, 132)",
                "rgb(54, 162, 235)",
                "rgb(255, 205, 86)",
              ],
            },
          ],
        },
        options: {
          events: []
        },
      });
      // the number of options == 2
    } else {
      new Chart(ctx, {
        type: "pie",
        data: {
          datasets: [
            {
              data: [this.topic.option_1_num, this.topic.option_2_num],
              backgroundColor: ["rgb(255, 99, 132)", "rgb(54, 162, 235)"],
            },
          ],
        },
        options: {
          events: []
        },
      });
    }
  },
  methods: {
    async getVotedStatus() {
      const res = await this.$axios.get("/votes", {
        params: {
          user_id: this.user.id,
          topic_id: this.topic.id,
        }
      });
      this.voted_status = res.data.voted_status;
      console.log(this.voted_status);
    },
    async getLimitedVote() {
      const res = await this.$axios.get("/count-votes", {
        params: {
          topic_id: this.topic.id,
          sex: this.sex,
          age: this.age,
        }
      });
      if (res.data[1]) {
        this.topic.option_1_num = res.data[1]
      } else {
        this.topic.option_1_num = 0
      }
      if (res.data[2]) {
        this.topic.option_2_num = res.data[2]
      } else {
        this.topic.option_2_num = 0
      }
      if (res.data[3]) {
        this.topic.option_3_num = res.data[3]
      } else {
        this.topic.option_3_num = 0
      }
      if (res.data[4]) {
        this.topic.option_4_num = res.data[4]
      } else {
        this.topic.option_4_num = 0
      }
      console.log(res.data)
    }
  },
};
</script>

<style lang="scss" scoped>
.topic-title,
.topic-description {
  text-align: left;
}
.change-color {
  color: $amber;
}
.plain-text {
  color: $gray;
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
  .topic-img {
    width: 100px;
    height: 100px;
    margin-right: 3rem;
  }
  .data-margin {
    margin-right: 1rem;
  }
  .topic-description {
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
