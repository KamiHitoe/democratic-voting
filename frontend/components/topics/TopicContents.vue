<template>
  <section class="vote-contents">
    <h4 class="subtitle">
      <nuxt-link class="change-color" to="/">トップ</nuxt-link>
      <span class="plain-text">　＞　</span>
      <a class="change-color" :href="`/search?category_id=${topics.category_id}`">{{ category }}</a>
    </h4>
    <v-divider></v-divider>
    <LimitedTag :topics="topics" tag_class="limited-tag" />
    <nuxt-link class="vote-body d-flex flex-row" :to="`/topics/${topics.id}`">
      <img class="topics-img" :src="topics.img_path" />
      <div class="topics-contents d-flex flex-column">
        <div class="d-flex flex-row">
          <p class="data-margin">{{ topics.voted_num }} votes</p>
          <p class="data-margin">{{ topics.timestamp }}</p>
          <Report class="data-margin" :user="user" :topics="topics" />
          <p class="data-margin change-color">
            {{ category }}
          </p>
        </div>
        <h2 class="topics-title">{{ topics.title }}</h2>
      </div>
    </nuxt-link>
    <p class="topics-description">{{ topics.description }}</p>

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
      <Voting :user="user" :topics="topics" />
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
// import LimitedSelect from "@/components/LimitedSelect.vue";
import LimitedTag from "@/components/LimitedTag.vue";
import Report from "@/components/default/Report.vue";
import { categoryList } from "@/data";

export default {
  components: {
    Voting,
    // LimitedSelect,
    LimitedTag,
    Report,
  },
  props: {
    user: Object,
    topics: Object,
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
      const res = await this.$axios.get("/votes", {
        params: {
          user_id: this.user.id,
          topic_id: this.topics.id,
        }
      });
      this.voted_status = res.data.voted_status;
      console.log(this.voted_status);
    },
    async getLimitedVote() {
      // const res = await this.$axios.get("/count-votes", {
      //   params: {
      //     topic_id: this.topics.id,
      //     sex: this.sex,
      //     age: this.age,
      //   }
      // });
      // this.topics.option_1_num = res.data[1]
      // this.topics.option_2_num = res.data[2]
      // this.topics.option_3_num = res.data[3]
      // this.topics.option_4_num = res.data[4]
      console.log('pushed')
    }
  },
};
</script>

<style lang="scss" scoped>
.topics-title,
.topics-description {
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
