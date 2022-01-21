# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Topic.create(user_id: 1, category_id: 1, title: "first topic", description: "this is first topic",
             option_1: "a", option_2: "b", option_3: "c", option_4: "d",
             option_1_num: 1, option_2_num: 2, option_3_num: 3, option_4_num: 4,
             img_path: "there")
Topic.create(user_id: 2, category_id: 2, title: "second topic", description: "this is second topic",
             option_1: "a", option_2: "b", option_3: "c",
             option_1_num: 1, option_2_num: 2, option_3_num: 3,
             img_path: "there")
Topic.create(user_id: 3, category_id: 3, title: "third topic", description: "this is third topic",
             option_1: "a", option_2: "b",
             option_1_num: 1, option_2_num: 2,
             img_path: "there")

Comment.create(user_id: 1, text: "first comment about topic 1", like_num: 1, topic_id: 1)
Comment.create(user_id: 2, parent_id: 1, text: "second comment about topic 1", like_num: 2, topic_id: 2)
Comment.create(user_id: 1, text: "first comment about topic 2", like_num: 1, topic_id: 1)

