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
- Test
  - [How to Test Rails Models with RSpec](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec)
  - [Guide to Unit Testing Vue Components](https://testdriven.io/blog/vue-unit-testing/)
- Format
  - [How To Use TypeScript with Vue Single File Components](https://www.digitalocean.com/community/tutorials/vuejs-using-typescript-with-vue)
  - [How to properly set up Nuxt with ESLint and Prettier in VSCode](https://medium.com/@gogl.alex/how-to-properly-set-up-eslint-with-prettier-for-vue-or-nuxt-in-vscode-e42532099a9c)
  - [Rubocop Configuration Files for Rails](https://prabinpoudel.com.np/articles/rubocop-configuration-files-for-rails/)
- Cookies
  - [Are You Using Cookies? Then This Ultimate Guide Is For You](https://html.com/resources/cookies-ultimate-guide/)


## 開発log

- infra
  - ECSをprivate subnetにしようとするとECRからimageをpullするためにもNAT gatewayが必要
  - ELBのListenersからPath based routingが設定可能. health checkのpathは正常にルーティングされるPathを指定する必要あり


