
Method|Endpoint|Functionality

- auth(Firebase Auth)
POST /v1/signup user sign up
POST /v1/auth/login user log in
GET /v1/auth/logout user log out

- users
POST /v1/users/ set the user's infos
PUT /v1/users/:id update the user's infos
GET /v1/users/:id get the user's infos

- topics
GET /v1/topics get all topics by searching
POST /v1/topics create a new topic
GET /v1/topics/:id get the topic

- comments
GET /v1/topics/:id/comments get all comments about topic
POST /v1/topics/:id/comments create a new comment about topic
GET /v1/topics/:id/comments/:id get the comment and replies

- categories(not needed because this is static source)
GET /v1/categories get all categories

