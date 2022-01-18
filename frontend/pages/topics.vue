<template>
  <section>
    <div class="contents">
      <h4>トップ　＞　{category}　＞　<span class="change-color">{title}</span></h4>
      <v-divider></v-divider>
      <div class="contents d-flex flex-row">
        <img class="topics-img" :src="topics.imgPath">
        <div class="topics-contents d-flex flex-column">
          <div class="d-flex flex-row">
            <p class="id data-margin">{{ topics.id }}</p>
            <p class="data-margin">{{ topics.comments }} comments</p>
            <p class="data-margin">{{ topics.created_at }}</p>
            <p class="data-margin change-color">{{ topics.category }}</p>
          </div>
          <h4 class="topics-title">{{ topics.title }}</h4>
        </div>
      </div>

      <canvas id="resultChart" width="100vw" height="20vw"></canvas>

    </div>

    <CategoryList />

  </section>
</template>

<script>
// import Vue from 'vue'
import Chart from 'chart.js'
import CategoryList from '../components/CategoryList.vue'

export default {
  components: {
    CategoryList,
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
        optionList: ['やがて君になる', 'マリア様がみてる', 'ゆるゆり', 'Citrus'],
      },
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
.topics-title {
  text-align: left;
}
.change-color {
  color: #FFC107;
}
.contents {
  padding: 1rem;
  background-color: #fff;
}
.topics-img {
  width: 100px;
  height: 100px;
  margin-right: 3rem;
}
.data-margin {
  margin-right: 1rem;
}
</style>
