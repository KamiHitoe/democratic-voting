# Democratic Voting

URL: https://democratic-voting.com/

## アプリ概要

「すべての投票を、民主化したい！」
という思いからこの投票アプリを制作しました。
きっかけはTwitter等の投票機能を使った時に、フォロワーが少ない人(信用経済弱者)は多くの人に投票してもらいたくてもシステム的に無理なことに違和感を覚えたからです。
聞きたいこと、調査したいことはもっと気軽に、誰にでもできたって良いじゃないか。
そうして生まれたのがこのアプリです。
ですので、このアプリは匿名性で誰でも好きにお題の投稿・投票ができる一方で、性別や年代を入力してもらうことで調査結果はより情報量の多いものにできるよう工夫しました。

![gif](https://github.com/KamiHitoe/img/blob/master/democratic-voting/democratic-voting.gif)

## Vision

- vision: 「すべての投票を、民主化したい！」
- why(なぜ作るのか):
  - 人に聞けないようなことを、民主の力で解決する
- what(何を作るのか): 
  - 匿名投票アプリ
- How(どのようにして実現するのか): 
  - 匿名による投票の民主化と通報による治安の自己組織化

## 技術スタック

- Frontend
  - Lang: JavaScript/TypeScript
  - FW: Nuxt.js
  - UI library: Vuetify
  - other: ESLint, Chart.js, Fuse.js
- Backend
  - Lang: Ruby: 2.7.5
  - FW: Rails 6.0.3
  - other: RSpec, Rubocop
- Infra
  - AWS(ECS, ECR, RDS, ALB)
  - container: Docker
  - CI/CI: CircleCI
  - IaC: Terraform
  - Auth: Firebase Auth

## インフラ構成図

![AWS](https://github.com/KamiHitoe/democratic-voting/blob/master/design/infra/architecture.prod.png)

## ER図

![ERD](https://github.com/KamiHitoe/democratic-voting/blob/master/design/backend/ERD.png)

## 機能群

- トピック生成機能
- トピック検索機能
  - キーワード検索
  - カテゴリ検索
- カテゴリ機能
  - カテゴリ一覧表示機能
- コメント機能
  - コメント機能
  - いいね機能
  - 返信機能
  - ページネーション機能
- 通報機能
- 画像投稿機能
- Twitter連携機能
- ゾーニング機能
  - 性別・年代集計機能
  - 性別・年代限定機能
- グラフ可視化機能

## Reference

- Frontend
  - Vuex
    - [Working With Nuxt and Vuex](https://langvad.dev/blog/working-with-nuxt-and-vuex/)
  - Pagination
    - [Vuetify Pagination (Server side) example](https://www.bezkoder.com/vuetify-pagination-server-side/)
    - Mixin
      - [How to use mixins in Nuxt.js](https://medium.com/@seyijosh44/how-to-use-mixins-in-nuxt-js-826724fa251)
- Backend
  - [Build a RESTful JSON API With Rails 5 - Part One](https://www.digitalocean.com/community/tutorials/build-a-restful-json-api-with-rails-5-part-one)
- Infra
  - [AWS — Deploying Vue.js With NodeJS Backend On ECS](https://medium.com/bb-tutorials-and-thoughts/aws-deploying-vue-js-with-nodejs-backend-on-ecs-cd3c3740b0a)
  - [More than "Hello World" in Docker: Build Rails + Sidekiq web apps in Docker](https://dev.to/raphael_jambalos/more-than-hello-world-in-docker-run-rails-sidekiq-web-apps-in-docker-1b37)
  - ALB
    - [AWS ECSにて、サービスで実行したタスクが3分置きに停止してしまう原因がわからない](https://teratail.com/questions/262962)
  - S3
    - [ブラウザから Amazon S3 への写真のアップロード](https://docs.aws.amazon.com/ja_jp/sdk-for-javascript/v2/developer-guide/s3-example-photo-album.html)
    - [Uploading Files in AWS S3 Bucket through JavaScript SDK with Progress Bar](https://medium.com/@shresthshruti09/uploading-files-in-aws-s3-bucket-through-javascript-sdk-with-progress-bar-d2a4b3ee77b5)
- Test
  - [How to Test Rails Models with RSpec](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec)
  - [Guide to Unit Testing Vue Components](https://testdriven.io/blog/vue-unit-testing/)
- Format
  - [How To Use TypeScript with Vue Single File Components](https://www.digitalocean.com/community/tutorials/vuejs-using-typescript-with-vue)
  - [How to properly set up Nuxt with ESLint and Prettier in VSCode](https://medium.com/@gogl.alex/how-to-properly-set-up-eslint-with-prettier-for-vue-or-nuxt-in-vscode-e42532099a9c)
  - [Rubocop Configuration Files for Rails](https://prabinpoudel.com.np/articles/rubocop-configuration-files-for-rails/)
- Cookies
  - [Are You Using Cookies? Then This Ultimate Guide Is For You](https://html.com/resources/cookies-ultimate-guide/)
- Twitter API
  - [ポートフォリオにTwitterAPIを使ってツイートする機能を実装する（アカウント申請した後の流れ）](https://qiita.com/naota7118/items/b3d50d9719e2dcb63e7c)



