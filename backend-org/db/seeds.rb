# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(uid: 'hitoe', age: 20, sex: 'male')
User.create(uid: 'tanaka', age: 30, sex: 'male')
User.create(uid: 'miyuki', age: 10, sex: 'female')
User.create(uid: 'alice', age: 20, sex: 'female')
User.create(uid: 'noiru', age: 30, sex: 'female')

Topic.create(user_id: 1, category_id: 2, title: '最強の百合漫画', description: '最強の百合漫画を決めるスレッドです。今宵、史上最強の百合カップリングを決めましょう',
             option_1: 'やがて君になる', option_2: 'マリア様がみてる', option_3: 'ゆるゆり', option_4: 'Citrus',
             img_path: 'https://images-na.ssl-images-amazon.com/images/I/61jxhHI6a9L.jpg')
Vote.create(user_id: 1, topic_id: 1, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 1, chosen_option: 2, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 1, chosen_option: 3, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 1, chosen_option: 4, age: 20, sex: 'female')
topic = Topic.find(1)
topic.update(voted_num: 4)
Topic.create(user_id: 2, category_id: 7, title: 'お気に入りのエディタ', description: '皆さんのお気に入りのエディタは何ですか？',
             option_1: 'Vim', option_2: 'Emax', option_3: 'その他',
             img_path: 'https://cdn-ssl-devio-img.classmethod.jp/wp-content/uploads/2018/09/vim-e1537247611733.png')
Vote.create(user_id: 1, topic_id: 2, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 2, chosen_option: 1, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 2, chosen_option: 2, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 2, chosen_option: 3, age: 20, sex: 'female')
topic = Topic.find(2)
topic.update(voted_num: 4)
Topic.create(user_id: 3, category_id: 14, title: 'お味噌汁に入れる具材', description: '日本の食卓に欠かせないものといえばお味噌汁。皆さんは何を入れていますか？',
             option_1: 'わかめ', option_2: '長ネギ', option_3: 'とうふ', option_4: '大根',
             img_path: 'https://www.shizensyokuhin.jp/excludes/dmlite/columns/article3/04/assets/img/post_main_pic.jpg')
Vote.create(user_id: 1, topic_id: 3, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 3, chosen_option: 1, age: 30, sex: 'male')
topic = Topic.find(3)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 2, title: 'あなたはオタクですか？', description: '実のところ、オタクな人は結構多いんじゃないかと思っています',
             option_1: 'はい', option_2: 'いいえ',
             img_path: 'https://images-na.ssl-images-amazon.com/images/I/71P-b69pJWL.jpg',
sex: 'male')
Vote.create(user_id: 1, topic_id: 4, chosen_option: 2, age: 20, sex: 'male')
topic = Topic.find(4)
topic.update(voted_num: 1)
Topic.create(user_id: 2, category_id: 3, title: '転職願望はありますか？', description: '20代の男性の人に転職意識調査をしたいと思います',
             option_1: 'はい', option_2: 'いいえ',
             img_path: 'https://one-group.jp/media/wp-content/uploads/2021/04/54e71251d4e94d7d3d2e586b8b0c58b0.jpg',
             sex: 'male', age: 20)
Vote.create(user_id: 1, topic_id: 5, chosen_option: 1, age: 20, sex: 'male')
topic = Topic.find(5)
topic.update(voted_num: 1)
Topic.create(user_id: 3, category_id: 2, title: '好きな少女漫画の系統', description: '一口に少女漫画と言ってもいろんな系統があると思いますが、皆さんはどんな少女漫画が好きですか？',
             option_1: '「君に届け」みたいな爽やか系', option_2: '「NANA」みたいなドロドロ系', option_3: '「L DK」みたいなオラオラ系', option_4: 'その他',
             img_path: 'https://m.media-amazon.com/images/M/MV5BZDI2MzAwMmItOTYwNy00ZDg4LTg0YzMtMzcwNjgwYTkwYTcyXkEyXkFqcGdeQXVyNjc3MjQzNTI@._V1_.jpg',
             sex: 'female')
Vote.create(user_id: 3, topic_id: 6, chosen_option: 3, age: 10, sex: 'female')
topic = Topic.find(6)
topic.update(voted_num: 1)
Topic.create(user_id: 4, category_id: 2, title: '好きなVtuber', description: '皆さんの好きなVtuberを教えてください',
             option_1: 'Gawr Gura', option_2: '桐生ココ', option_3: '月ノ美兎', option_4: 'キズナアイ',
             img_path: 'https://images.microcms-assets.io/assets/08e9ffa2c9d94cf88900071dfa1879e9/bea0bf53b6eb46f79bb54c65a01bfadf/liver-cropped_Mito_Tsukino.png?w=657')
Vote.create(user_id: 1, topic_id: 7, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 7, chosen_option: 3, age: 30, sex: 'male')
topic = Topic.find(7)
topic.update(voted_num: 2)
Topic.create(user_id: 5, category_id: 15, title: 'コロナワクチン打ちましたか？', description: '皆さんは3回目のワクチンをもう摂取しましたか？',
             option_1: 'はい', option_2: 'いいえ',
             img_path: 'https://www.city.akashi.lg.jp/kansentaisaku/wakutin/images/3kaime.png')
Vote.create(user_id: 1, topic_id: 8, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 8, chosen_option: 1, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 8, chosen_option: 2, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 8, chosen_option: 1, age: 20, sex: 'female')
topic = Topic.find(8)
topic.update(voted_num: 4)




Comment.create(user_id: 1, text: 'やっぱりマリア様がみてる一強か～そうだよね～～ごきげんよう',
               topic_id: 1)
Comment.create(user_id: 2, parent_id: 1, text: 'わかる。聖様が好き', topic_id: 1)
Comment.create(user_id: 3, text: 'ゆるゆりしか勝たん', topic_id: 1)
Comment.create(user_id: 1, text: '白薔薇いいよね', topic_id: 1, parent_id: 2)
Comment.create(user_id: 2, text: '私は乃梨子派～', topic_id: 1, parent_id: 2)

Like.create(user_id: 1, comment_id: 1)
Like.create(user_id: 1, comment_id: 4)
Like.create(user_id: 2, comment_id: 3)
Like.create(user_id: 3, comment_id: 3)
Like.create(user_id: 4, comment_id: 3)




