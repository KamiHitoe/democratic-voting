# FROM node:14.3
FROM node:16.14

WORKDIR /app

ENV LANG C.UTF-8 \
    TZ Asia/Tokyo

# first, copy package to container
ADD package.json /app/package.json
ADD package-lock.json /app/package-lock.json

# install nuxt dependencies
RUN apt-get update -y && \
    apt-get upgrade -y && \
    npm install -g npm@8.5.1 && \

    # npm install -g npm && \
    # npm install -g ejs@3.1.6 && \
    # npm install -g nuxt@2.15.8 && \
    # npm install -g create-nuxt-app@2.15.0 &&\
    # npm install -g defu@3.1.0 && \
    # npm install -g typescript && \
    npm install

# copy whole app
ADD . /app

# create build files
RUN yarn build

ENV NUXT_HOST=0.0.0.0
EXPOSE 8080

# start prod with host specified
# CMD ["yarn", "start", "-H", "0.0.0.0"]
CMD ["yarn", "start"]
