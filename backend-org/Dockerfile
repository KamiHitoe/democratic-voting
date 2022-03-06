# FROM ruby:2.7.5-slim
FROM ruby:2.7.5

ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo

# create /app folder and go into that folder
RUN mkdir /app
WORKDIR /app

# copy the Gemfile from root directory into /app/ folder
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# install rails dependencies
# add Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev && \
    apt-get install -y ruby2.7-dev && \
    gem install bundler && \
    gem install nio4r -v '2.5.8' --source 'https://rubygems.org/' && \
    gem install websocket-driver -v '0.7.5' --source 'https://rubygems.org/' && \
    gem install digest -v '3.1.0' --source 'https://rubygems.org/' && \
    gem install io-wait -v '0.2.1' --source 'https://rubygems.org/' && \
    gem install strscan -v '3.0.1' --source 'https://rubygems.org/' && \
    gem install racc -v '1.6.0' --source 'https://rubygems.org/' && \
    gem install io-console -v '0.5.11' --source 'https://rubygems.org/' && \
    gem install debug -v '1.4.0' --source 'https://rubygems.org/' && \
    gem install ffi -v '1.15.5' --source 'https://rubygems.org/' && \
    gem install pg -v '1.3.2' --source 'https://rubygems.org/' && \
    gem install puma -v '5.5.2' --source 'https://rubygems.org/' && \
    # bundle update && \
    bundle install

# Add a script to be executed every time the container starts.
COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3000

# copy the whole app
ADD . /app

# run app
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
