<template>
  <main>
    <section class="vote-contents">
      <h4 class="subtitle">トップ　＞　{category}</h4>
      <v-divider></v-divider>
      <div class="vote-body d-flex flex-row">
        <img class="topics-img" :src="topics.imgPath">
        <div class="topics-contents d-flex flex-column">
          <div class="d-flex flex-row">
            <p class="data-margin">{{ topics.comments }} comments</p>
            <p class="data-margin">{{ topics.created_at }}</p>
            <p class="data-margin change-color">{{ topics.category }}</p>
          </div>
          <h2 class="topics-title">{{ topics.title }}</h2>
        </div>
      </div>
      <p class="topics-description">{{ topics.description }}</p>

      <canvas id="resultChart" width="100vw" height="20vw"></canvas>
      <v-btn class="vote-btn" color="amber" to="#" dark>投票する</v-btn>
    </section>

    <section class="comment-contents">
      <h4 class="comment-subtitle">コメント</h4>
      <v-divider></v-divider>
      <Comments
        v-for="comment in commentList"
        :key="comment.id"
        :comment=comment
      />
      <CommentBox />
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
import { commentList } from '../data/data'

export default {
  components: {
    CategorySection,
    Comments,
    CommentBox,
    RelatedTopics,
  },
  data() {
    return {
      topics: {
        imgPath: "https://images-na.ssl-images-amazon.com/images/I/61jxhHI6a9L.jpg",
        id: 1,
        comments: 128,
        created_at: '2022/01/03',
        category: 'アニメ・漫画',
        title: '最強の百合漫画',
        description: '最強の百合漫画を決めるスレッドです。今宵、史上最強の百合カップリングを決めましょう',
        optionList: ['やがて君になる', 'マリア様がみてる', 'ゆるゆり', 'Citrus'],
      },
      commentList: commentList,
    }
  },
  mounted() {
    const ctx = document.getElementById('resultChart');
    new Chart(ctx, {
      type: 'pie',
      data: {
        labels: [
          this.topics.optionList[0],
          this.topics.optionList[1],
          this.topics.optionList[2],
          this.topics.optionList[3],
        ],
        datasets: [{
          label: 'My First Dataset',
          data: [50, 80, 70, 30],
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
