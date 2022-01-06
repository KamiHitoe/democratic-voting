FROM ruby:2.7.5-slim

ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo

# create /app folder and go into that folder
RUN mkdir /app
WORKDIR /app

# copy the Gemfile from root directory into /app/ folder
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# install rails dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev && \
    bundle install

# copy the whole app
ADD . /app

# run app
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
