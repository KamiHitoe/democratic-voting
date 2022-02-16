
Method|Endpoint|Functionality

- users
GET /v1/users get the user's info by uid
  params: [uid]
POST /v1/users set the user's info

- topics
GET /v1/topics get all topics in top page
  params: [q]
POST /v1/topics create a new topic
GET /v1/topics/:id get the topic
PUT /v1/topics/:id update option_num in the topic
DELETE /v1/topics/:id delete the topic
GET /v1/search get topics in search page
  params: [category_id, period, sex, age,  sort]

- comments
GET /v1/topics/:id/comments get all comments in the topic
POST /v1/topics/:id/comments create a new comment in the topic
GET /v1/topics/:id/comments/:id get the comment
DELETE /v1/topics/:id/comments/:id delete the comment
GET /v1/comments/:topic_id/:replied_comment_id get replies in the parent comment
  params: [replied_comment_id]

- likes
GET /likes/count get the number of likes
  params: [comment_id]
GET /likes get liked status by user
  params: [user_id, comment_id]
POST /likes update liked status by user
DELETE /likes delete liked status by user

- votes
GET /votes/count get the number of votes
  params: [topic_id]
GET /votes get voted status by user
  params: [user_id, topic_id]
POST /votes update voted status by user
DELETE /votes delete voted status by user

- report_topics
GET /report/topics/count get the number of report/topics
  params: [topic_id]
GET /report/topics get reported status by user
  params: [user_id, topic_id]
POST /report/topics update reported status by user
DELETE /report/topics delete reported status by user

- report_comments
GET /report/comments/count get the number of report-comments
  params: [comment_id]
GET /report/comments get reported status by user
  params: [user_id, comment_id]
POST /report/comments update reported status by user
DELETE /report/comments delete reported status by user
