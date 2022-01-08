


## Reference

- Infra
  - [AWS — Deploying Vue.js With NodeJS Backend On ECS](https://medium.com/bb-tutorials-and-thoughts/aws-deploying-vue-js-with-nodejs-backend-on-ecs-cd3c3740b0a)
  - [More than "Hello World" in Docker: Build Rails + Sidekiq web apps in Docker](https://dev.to/raphael_jambalos/more-than-hello-world-in-docker-run-rails-sidekiq-web-apps-in-docker-1b37)
- Test
  - [How to Test Rails Models with RSpec](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec)


### つまった点

- Rails x PostgreSQL
  1. write correct host in database.yml
  2. run rails db:create
  3. run rails db:migrate
  - AWS
    - you can specify public access SG that allow all source(0.0.0.0)

