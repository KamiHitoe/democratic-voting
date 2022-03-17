<template>
  <section class="vote-contents">
    <h4 class="subtitle">
      <nuxt-link class="change-color" to="/">トップ</nuxt-link>
      <span class="plain-text">　＞　</span>
      <a
        class="change-color"
        :href="`/search?category_id=${topic.category_id}`"
        >{{ category }}</a
      >
    </h4>
    <v-divider></v-divider>
    <LimitedTag :topic="topic" tag_class="limited-tag" />
    <nuxt-link class="vote-body" :to="`/topics/${topic.id}`">
      <img v-if="topic.img_path" class="topic-img" :src="topic.img_path" />
      <img
        v-else
        class="topic-img"
        src="https://test-democratic-img.s3.ap-northeast-1.amazonaws.com/no_image.png"
      />
      <div class="topic-contents">
        <div class="topic-information">
          <div class="topic-data">
            <p class="data-margin">{{ topic.voted_num }}投票</p>
            <p class="data-margin">{{ topic.timestamp }}</p>
            <Report class="data-margin" :user="user" :topic="topic" />
          </div>
          <p class="topic-category data-margin change-color">
            {{ category }}
          </p>
        </div>
        <h2 class="topic-title">{{ topic.title }}</h2>
      </div>
    </nuxt-link>
    <p class="topic-description">{{ topic.description }}</p>

    <div class="grid-container">
      <v-select
        v-model="sex"
        :items="sexItems"
        label="性別"
        item-color="amber"
        solo
        dense
        @change="voteAndChangeColor(1)"
      ></v-select>
      <v-select
        v-model="age"
        :items="ageItems"
        label="年代"
        item-color="amber"
        solo
        dense
        @change="voteAndChangeColor(2)"
      ></v-select>
    </div>

    <div class="result-container">
      <canvas id="result-chart"></canvas>
      <div class="result-option flex-column justify-center">
        <p>
          {{ topic.option_1 }}<br />
          <span class="chart-label-1">&nbsp;</span>
          {{ topic.option_1_num }}票
        </p>
        <p>
          {{ topic.option_2 }}<br />
          <span class="chart-label-2">&nbsp;</span>
          {{ topic.option_2_num }}票
        </p>
        <p v-if="topic.option_3">
          {{ topic.option_3 }}<br />
          <span class="chart-label-3">&nbsp;</span>
          {{ topic.option_3_num }}票
        </p>
        <p v-if="topic.option_4">
          {{ topic.option_4 }}<br />
          <span class="chart-label-4">&nbsp;</span>
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

    <a target="_blank" :href="`https://twitter.com/intent/tweet?text=投票をみんなに共有しよう！ https://www.democratic-voting.com/topics/${topic.id}`">
      <img class="twitter-share-button" :src="require('@/static/twitter-share-button.png')">
    </a>

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
        { text: "なし", value: "" },
        {
          text: "男性",
          value: "male",
          backgroundColor: "amber",
          color: "amber",
        },
        { text: "女性", value: "female", backgroundColor: "amber" },
      ],
      ageItems: [
        { text: "なし", value: 0 },
        { text: "10代", value: 10 },
        { text: "20代", value: 20 },
        { text: "30代", value: 30 },
        { text: "40代", value: 40 },
        { text: "50代", value: 50 },
      ],
      sex: null,
      age: null,
    };
  },
  watch: {
    topic() {
      this.category = this.categoryList[this.topic.category_id - 1].category;
      this.getLimitedVote();
    },
  },
  updated() {
    // this.category = this.categoryList[this.topic.category_id - 1].category
    console.log(this.category);
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
          events: [],
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
          events: [],
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
          events: [],
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
        },
      });
      this.voted_status = res.data.voted_status;
      console.log(this.voted_status);
    },
    async getLimitedVote() {
      const res = await this.$axios.get("/votes/count", {
        params: {
          topic_id: this.topic.id,
          sex: this.sex,
          age: this.age,
        },
      });
      if (res.data[1]) {
        this.topic.option_1_num = res.data[1];
      } else {
        this.topic.option_1_num = 0;
      }
      if (res.data[2]) {
        this.topic.option_2_num = res.data[2];
      } else {
        this.topic.option_2_num = 0;
      }
      if (res.data[3]) {
        this.topic.option_3_num = res.data[3];
      } else {
        this.topic.option_3_num = 0;
      }
      if (res.data[4]) {
        this.topic.option_4_num = res.data[4];
      } else {
        this.topic.option_4_num = 0;
      }
      console.log(res.data);
    },
    changeOptionColor(i) {
      const target = document.querySelectorAll(".v-input__slot")[i];
      target.classList.add("amber");
      target.classList.add("lighten-4");
    },
    voteAndChangeColor(i) {
      this.getLimitedVote();
      this.changeOptionColor(i);
    },
  },
};
</script>

<style lang="scss" scoped>
.topic-title,
.topic-description {
  text-align: left;
}
.change-color {
  color: $scarlet;
}
.plain-text {
  color: $gray;
}
.result-container {
  display: flex;
}
@media (min-width: 600px) {
  .vote-body,
  .topic-information,
  .topic-data {
    display: flex;
  }
  .topic-img {
    margin-right: 3rem;
  }
  .grid-container {
    display: grid;
    grid-template-columns: repeat(2, 30%);
    column-gap: 1rem;
  }
}
@media (max-width: 600px) {
  .topic-data {
    display: flex;
  }
  .topic-img {
    margin: 1rem 0;
  }
  .topic-category {
    text-align: left;
  }
  .grid-container {
    display: grid;
    grid-template-columns: repeat(2, auto);
    column-gap: 1rem;
  }
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
  }
  .data-margin {
    margin-right: 1rem;
  }
  .topic-description {
    margin: 2rem 0;
  }
  .result-option {
    text-align: left;
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
