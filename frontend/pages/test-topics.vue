<template>
  <main>
    <section class="vote-contents">
      <h4 class="subtitle">トップ　＞　{{ categoryList[topics.category_id].category }}</h4>
      <v-divider></v-divider>
      <div class="vote-body d-flex flex-row">
        <img class="topics-img" :src="topics.img_path">
        <div class="topics-contents d-flex flex-column">
          <div class="d-flex flex-row">
            <p class="data-margin">{{ topics.option_1_num + topics.option_2_num + topics.option_3_num + topics.option_4_num }} votes</p>
            <p class="data-margin">{{ topics.timestamp }}</p>
            <p class="data-margin change-color">{{ categoryList[topics.category_id].category }}</p>
          </div>
          <h2 class="topics-title">{{ topics.title }}</h2>
        </div>
      </div>
      <p class="topics-description">{{ topics.description }}</p>

      <canvas id="resultChart" width="100vw" height="20vw"></canvas>
      <v-btn
        class="vote-btn"
        color="amber"
        dark
        @click="openVoting"
        v-if="!voting"
        >投票する
      </v-btn>

      <Voting
        v-if="voting"
        :topics=topics
      />
    </section>

    <section class="comment-contents">
      <h4 class="comment-subtitle">コメント</h4>
      <v-divider></v-divider>
      <Comments
        v-for="comment in commentList"
        :key="comment.id"
        :comment=comment
        :topic_id=topics.id
      />
      <CommentBox 
        :topic_id=topics.id
      />
    </section>

    <RelatedTopics />
    <CategorySection />

  </main>
</template>

<script>
// import Vue from 'vue'
import Chart from 'chart.js'
import CategorySection from '../components/CategorySection.vue'
import Comments from '../components/Comments.vue'
import CommentBox from '../components/CommentBox.vue'
import RelatedTopics from '../components/RelatedTopics.vue'
import Voting from '../components/Voting.vue'
import { categoryList } from '../data/data'

export default {
  components: {
    CategorySection,
    Comments,
    CommentBox,
    RelatedTopics,
    Voting,
  },
  data() {
    return {
      topics: {
        category_id: 0,
      },
      commentList: [],
      categoryList: categoryList,
      voting: false,
    }
  },
  async mounted() {
    await this.getTopics();
    await this.getComments();
    const ctx = document.getElementById('resultChart');
    new Chart(ctx, {
      type: 'pie',
      data: {
        labels: [
          this.topics.option_1,
          this.topics.option_2,
          this.topics.option_3,
          this.topics.option_4,
        ],
        datasets: [{
          label: 'My First Dataset',
          data: [
            this.topics.option_1_num,
            this.topics.option_2_num,
            this.topics.option_3_num,
            this.topics.option_4_num,
          ],
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)',
            'rgb(255, 5, 86)',
          ],
          hoverOffset: 4
        }]
      },
      options: {
        plugins: {
          legend: {
            display: true,
            position: 'right',
            align: 'left',
          }
        }
      },
    })
  },
  methods: {
    async getTopics() {
      const res = await this.$axios.get('/topics/1')
      this.topics = res.data
      console.log(this.topics);
    },
    async getComments() {
      const res = await this.$axios.get(`/topics/1/comments`);
      this.commentList = res.data;
      console.log(res.data);
    },
    openVoting() {
      this.voting = true;
    }
  },
}
</script>

<style lang="scss" scoped>
.subtitle, .topics-title, .topics-description {
  text-align: left;
}
.change-color, .comment-subtitle {
  color: $amber;
}
.vote-contents {
  padding: 1rem;
  background-color: #fff;
  text-align: center;
  .vote-body {
    margin-top: 1rem;
  }
  .vote-btn {
    margin: 1rem 0;
  }
}
.comment-contents {
  margin-top: 2rem;
  background-color: #fff;
  padding: 1rem;
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
</style>
