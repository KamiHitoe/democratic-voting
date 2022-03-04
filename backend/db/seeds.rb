# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(uid: 'hitoe', age: 20, sex: 'male')
User.create(uid: 'miyuki', age: 10, sex: 'female')
User.create(uid: 'noiru', age: 30, sex: 'female')
User.create(uid: 'airi', age: 10, sex: 'female')
User.create(uid: 'alice', age: 20, sex: 'female')

Topic.create(user_id: 1, category_id: 1, title: '最強の百合漫画', description: '最強の百合漫画を決めるスレッドです。今宵、史上最強の百合カップリングを決めましょう',
             option_1: 'やがて君になる', option_2: 'マリア様がみてる', option_3: 'ゆるゆり', option_4: 'Citrus',
             img_path: 'https://images-na.ssl-images-amazon.com/images/I/61jxhHI6a9L.jpg')
Topic.create(user_id: 2, category_id: 2, title: 'お気に入りのエディタ', description: '皆さんのお気に入りのエディタは何ですか？',
             option_1: 'Vim', option_2: 'Emax', option_3: 'その他',
             img_path: 'https://cdn-ssl-devio-img.classmethod.jp/wp-content/uploads/2018/09/vim-e1537247611733.png')
Topic.create(user_id: 3, category_id: 5, title: 'お味噌汁に入れる具材', description: '日本の食卓に欠かせないものといえばお味噌汁。皆さんは何を入れていますか？',
             option_1: 'わかめ', option_2: '長ネギ', option_3: 'とうふ', option_4: '大根',
             img_path: 'https://www.shizensyokuhin.jp/excludes/dmlite/columns/article3/04/assets/img/post_main_pic.jpg')
Topic.create(user_id: 1, category_id: 6, title: 'あなたはオタクですか？', description: '実のところ、オタクな人は結構多いんじゃないかと思っています',
             option_1: 'はい', option_2: 'いいえ',
             img_path: 'https://images-na.ssl-images-amazon.com/images/I/71P-b69pJWL.jpg',
             sex: 'male')
Topic.create(user_id: 2, category_id: 6, title: '転職願望はありますか？', description: '20代の男性の人に転職意識調査をしたいと思います',
             option_1: 'はい', option_2: 'いいえ',
             img_path: 'https://one-group.jp/media/wp-content/uploads/2021/04/54e71251d4e94d7d3d2e586b8b0c58b0.jpg',
             sex: 'male', age: 20)
Topic.create(user_id: 3, category_id: 1, title: '好きな少女漫画の系統', description: '一口に少女漫画と言ってもいろんな系統があると思いますが、皆さんはどんな少女漫画が好きですか？',
             option_1: '「君に届け」みたいな爽やか系', option_2: '「NANA」みたいなドロドロ系', option_3: '「L DK」みたいなオラオラ系', option_4: 'その他',
             img_path: 'https://m.media-amazon.com/images/M/MV5BZDI2MzAwMmItOTYwNy00ZDg4LTg0YzMtMzcwNjgwYTkwYTcyXkEyXkFqcGdeQXVyNjc3MjQzNTI@._V1_.jpg',
             sex: 'female')

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

Vote.create(user_id: 1, topic_id: 1, chosen_option: 1)
Vote.create(user_id: 2, topic_id: 1, chosen_option: 2)
Vote.create(user_id: 3, topic_id: 1, chosen_option: 3)
Vote.create(user_id: 4, topic_id: 1, chosen_option: 4)
Vote.create(user_id: 1, topic_id: 2, chosen_option: 1)
Vote.create(user_id: 2, topic_id: 2, chosen_option: 1)
Vote.create(user_id: 3, topic_id: 2, chosen_option: 2)
Vote.create(user_id: 4, topic_id: 2, chosen_option: 3)
Vote.create(user_id: 1, topic_id: 3, chosen_option: 1)
Vote.create(user_id: 2, topic_id: 3, chosen_option: 1)
Vote.create(user_id: 3, topic_id: 4, chosen_option: 2)
Vote.create(user_id: 4, topic_id: 5, chosen_option: 3)
Vote.create(user_id: 4, topic_id: 6, chosen_option: 3)


