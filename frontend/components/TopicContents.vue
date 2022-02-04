<template>
  <section class="vote-contents">
    <h4 class="subtitle">
      トップ　＞　{{ categoryList[topics.category_id].category }}
    </h4>
    <v-divider></v-divider>
    <div class="limited-vote d-flex flex-row">
      <p v-if="topics.sex" class="limited-box">{{ topics.sex }}限定投票</p>
      <p v-if="topics.age" class="limited-box">{{ topics.age }}代限定投票</p>
    </div>
    <nuxt-link class="vote-body d-flex flex-row" :to="`/topics/${topics.id}`">
      <img class="topics-img" :src="topics.img_path" />
      <div class="topics-contents d-flex flex-column">
        <div class="d-flex flex-row">
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
        <h2 class="topics-title">{{ topics.title }}</h2>
      </div>
    </nuxt-link>
    <p class="topics-description">{{ topics.description }}</p>
    <canvas id="resultChart" width="100vw" height="20vw"></canvas>

    <div v-if="!$route.params.topic_id && !topics.sex && !topics.age">
      <div v-if="$store.state.voted_status">
        <p class="voted-comment">投票ありがとうございました！</p>
      </div>
      <div v-else>
        <v-btn
          v-if="!voting"
          class="vote-btn"
          color="amber"
          dark
          @click="openVoting"
          >投票する
        </v-btn>

        <Voting v-if="voting" :topics="topics" />
      </div>
    </div>

  </section>
</template>

<script>
// import Vue from 'vue'
import Chart from "chart.js";
import Voting from "@/components/Voting.vue";
import { categoryList } from "@/data/data";

export default {
  components: {
    Voting,
  },
  props: {
    topics: Object,
  },
  data() {
    return {
      categoryList: categoryList,
      voting: false,
    };
  },
  updated() {
    const ctx = document.getElementById("resultChart");
    new Chart(ctx, {
      type: "pie",
      data: {
        labels: [
          this.topics.option_1,
          this.topics.option_2,
          this.topics.option_3,
          this.topics.option_4,
        ],
        datasets: [
          {
            label: "My First Dataset",
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
      options: {
        plugins: {
          legend: {
            display: true,
            position: "right",
            align: "left",
          },
        },
      },
    });
  },
  methods: {
    async getVotedStatus() {
      const res = await this.$axios.get(
        `/votes/${this.user.id}/${this.topics.id}`
      );
      this.voted_status = res.data.voted_status;
      console.log(this.voted_status);
    },
    openVoting() {
      this.voting = true;
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
  .vote-btn,
  .voted-comment {
    margin: 1rem 0;
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
</style>
