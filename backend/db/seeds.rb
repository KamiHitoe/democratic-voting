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
Topic.create(user_id: 1, category_id: 4, title: 'どの程度の間、恋人がいませんか？', description: '皆さんはどの程度の間、恋人がいませんか？',
             option_1: '3ヶ月以内', option_2: '1年以内', option_3: '5年以内', option_4: 'いたことがない',
             img_path: 'https://pbs.twimg.com/profile_images/504619719161155584/2X8doCLf_400x400.png')
Vote.create(user_id: 1, topic_id: 9, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 9, chosen_option: 2, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 9, chosen_option: 3, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 9, chosen_option: 4, age: 20, sex: 'female')
topic = Topic.find(9)
topic.update(voted_num: 4)
Topic.create(user_id: 1, category_id: 5, title: '皆さんの初体験はいつですか？', description: '実際のところいつ頃なのかが気になります',
             option_1: '中学生以下', option_2: '高校生', option_3: '大学生', option_4: 'それ以外',
             img_path: 'https://cdn-prod.medicalnewstoday.com/content/images/articles/321/321428/couple-having-sex.jpg')
Vote.create(user_id: 1, topic_id: 10, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 10, chosen_option: 2, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 10, chosen_option: 3, age: 10, sex: 'female')
topic = Topic.find(10)
topic.update(voted_num: 3)
Topic.create(user_id: 1, category_id: 8, title: '何かしらの投資をやっていますか？', description: '株式でも不動産でもいいので、皆さんは何か投資をやっていますか？',
             option_1: 'はい', option_2: 'いいえ',
             img_path: 'https://booklive.jp/bkmr/wp-content/uploads/2015/12/equity-investment-comic-1.jpg')
Vote.create(user_id: 1, topic_id: 11, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 11, chosen_option: 1, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 11, chosen_option: 1, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 11, chosen_option: 2, age: 20, sex: 'female')
topic = Topic.find(11)
topic.update(voted_num: 4)
Topic.create(user_id: 1, category_id: 9, title: 'これと言った趣味がない人', description: '私はYoutube視聴や睡眠以外のこれと言った趣味がありません。でも、案外私と同じような人って多いと思うんです',
             option_1: 'これと言った趣味がない', option_2: '打ち込んでいる趣味がある',
             img_path: 'https://kinarino.k-img.com/system/press_images/001/313/474/1fb90657328052a72f37b1451971606c7ee6191c.jpg?1539448905')
Vote.create(user_id: 1, topic_id: 12, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 12, chosen_option: 1, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 12, chosen_option: 2, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 12, chosen_option: 2, age: 20, sex: 'female')
topic = Topic.find(12)
topic.update(voted_num: 4)
Topic.create(user_id: 1, category_id: 10, title: '好きな音楽のジャンルは何ですか？', description: '最近は日本人でもJ-POP以外を聞いてる人は多いと思うので私と同じ20代の人に質問です',
             option_1: 'J-POP', option_2: 'ロック', option_3: 'サブカル系', option_4: 'その他',
             img_path: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGyA8ZoKw88EBgm0P1iiskMvIJJmthSe7ukr-IwrNW0zZDqJVDYvPN7zhyWFVTXEmyF5g&usqp=CAU',
             age: 20)
Vote.create(user_id: 1, topic_id: 13, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 4, topic_id: 13, chosen_option: 4, age: 20, sex: 'female')
topic = Topic.find(13)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 11, title: '脱毛してますか？', description: '脱毛サロンに通おうか悩んでいるので質問です',
             option_1: 'はい', option_2: 'いいえ',
             img_path: 'https://imgbp.hotp.jp/CSP/IMG_SRC_K/13/49/C021211349/C021211349_419-314.jpg',
             sex: 'female')
Vote.create(user_id: 3, topic_id: 14, chosen_option: 1, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 14, chosen_option: 1, age: 20, sex: 'female')
Vote.create(user_id: 5, topic_id: 14, chosen_option: 2, age: 30, sex: 'female')
topic = Topic.find(14)
topic.update(voted_num: 3)
Topic.create(user_id: 1, category_id: 15, title: '皆さんどの程度お酒を飲んでますか？', description: '二極化しそうなお題ですが投降させてもらいました',
             option_1: '毎日', option_2: '一週間に数回', option_3: '月に数回', option_4: '月に数回以下',
             img_path: 'https://img1.kakaku.k-img.com/images/maga/15290/pixta_54452015_M.jpg')
Vote.create(user_id: 3, topic_id: 15, chosen_option: 1, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 15, chosen_option: 2, age: 20, sex: 'female')
Vote.create(user_id: 5, topic_id: 15, chosen_option: 4, age: 30, sex: 'female')
topic = Topic.find(15)
topic.update(voted_num: 3)
Topic.create(user_id: 1, category_id: 16, title: '子どもは何人欲しいですか？', description: '少子化の世の中ですが、皆さんは子どもは何人欲しいですか？',
             option_1: '0人', option_2: '1人', option_3: '2人', option_4: '3人以上',
             img_path: 'https://public.potaufeu.asahi.com/2b91-p/picture/22484021/9d6aa9fdc47b29b0cacc7845bdb41c41_640px.jpg')
Vote.create(user_id: 1, topic_id: 16, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 16, chosen_option: 1, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 16, chosen_option: 2, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 16, chosen_option: 2, age: 20, sex: 'female')
topic = Topic.find(16)
topic.update(voted_num: 4)
Topic.create(user_id: 1, category_id: 17, title: 'ウクライナからの移民を受け入れることについてどう思いますか？', description: '今一番話題のネタについて皆さんの意見を聞かせてください',
             option_1: '賛成', option_2: '反対',
             img_path: 'https://newsatcl-pctr.c.yimg.jp/r/iwiz-amd/20220216-00010000-socra-000-1-view.jpg?pri=l&w=640&h=540&exp=10800')
Vote.create(user_id: 1, topic_id: 17, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 17, chosen_option: 1, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 17, chosen_option: 2, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 17, chosen_option: 2, age: 20, sex: 'female')
topic = Topic.find(17)
topic.update(voted_num: 4)
Topic.create(user_id: 1, category_id: 1, title: '結婚したいと思いますか？', description: '20代の人に質問です。日本経済も低迷していて未婚率も過去最高を記録する今、結婚したいと思っていますか？',
             option_1: 'はい', option_2: 'いいえ',
             img_path: 'https://images-na.ssl-images-amazon.com/images/I/413W4G870GL._SX318_BO1,204,203,200_.jpg',
             age: 20)
Vote.create(user_id: 1, topic_id: 18, chosen_option: 2, age: 20, sex: 'male')
Vote.create(user_id: 4, topic_id: 18, chosen_option: 1, age: 20, sex: 'female')
topic = Topic.find(18)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 2, title: '好みの少年誌は何ですか？', description: '私はマガジンのラブコメが好きです',
             option_1: 'ジャンプ', option_2: 'サンデー', option_3: 'マガジン', option_4: 'その他',
             img_path: 'https://ogre.natalie.mu/media/pp/static/comic/kanokano/photo03.jpg?impolicy=pp_image')
Vote.create(user_id: 1, topic_id: 19, chosen_option: 3, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 19, chosen_option: 4, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 19, chosen_option: 1, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 19, chosen_option: 1, age: 20, sex: 'female')
Vote.create(user_id: 4, topic_id: 19, chosen_option: 2, age: 30, sex: 'female')
topic = Topic.find(19)
topic.update(voted_num: 5)
Topic.create(user_id: 1, category_id: 3, title: '皆さんは仕事に何を求めますか？', description: '皆さんが仕事で一番大事だと思う要素を知りたいです',
             option_1: '年収', option_2: 'やりがい', option_3: '労働環境', option_4: 'その他',
             img_path: 'https://president.ismcdn.jp/mwimgs/7/c/450wm/img_7c784b1ad90740566390b815fe37dda22939964.jpg')
Vote.create(user_id: 1, topic_id: 20, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 20, chosen_option: 2, age: 30, sex: 'male')
Vote.create(user_id: 3, topic_id: 20, chosen_option: 3, age: 10, sex: 'female')
Vote.create(user_id: 4, topic_id: 20, chosen_option: 2, age: 20, sex: 'female')
Vote.create(user_id: 4, topic_id: 20, chosen_option: 4, age: 30, sex: 'female')
topic = Topic.find(20)
topic.update(voted_num: 5)
Topic.create(user_id: 1, category_id: 4, title: '自分の顔にコンプレックスがある人', description: '私は自分の顔にコンプレックスがあり自信がもてません。皆さんはどうでしょうか？',
             option_1: 'コンプレックスがある', option_2: 'コンプレックスはない',
             img_path: 'https://d2oe4hwshyef6j.cloudfront.net/production/uploads/image/post_body_picture/image/327889/picture_mobile_b074b1ccc9a58c704027d14087d3be8c9b1f071e')
Vote.create(user_id: 1, topic_id: 21, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 4, topic_id: 21, chosen_option: 2, age: 20, sex: 'female')
Vote.create(user_id: 4, topic_id: 21, chosen_option: 1, age: 30, sex: 'female')
topic = Topic.find(21)
topic.update(voted_num: 3)
Topic.create(user_id: 1, category_id: 5, title: '自分のイチモツに自信がある人', description: '日本人は海外の人に比べて短小だと言われていますが、自分のイチモツに自信がない人ばかりなのか調査したいです',
             option_1: '自信がある', option_2: '自信がない',
             img_path: 'https://asset.watch.impress.co.jp/img/ktw/docs/1147/210/2_m.jpg',
             sex: 'male')
Vote.create(user_id: 1, topic_id: 22, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 22, chosen_option: 2, age: 30, sex: 'male')
topic = Topic.find(22)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 6, title: '陰キャですか？　陽キャですか？', description: '私は陰キャです',
             option_1: '陰キャ', option_2: '陽キャ',
             img_path: 'https://zukan.pokemon.co.jp/zukan-api/up/images/index/f8617a1e47fbc5fc2b5a53cd5a5989df.png')
Vote.create(user_id: 1, topic_id: 23, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 23, chosen_option: 2, age: 30, sex: 'male')
Vote.create(user_id: 4, topic_id: 23, chosen_option: 1, age: 20, sex: 'female')
topic = Topic.find(23)
topic.update(voted_num: 3)
Topic.create(user_id: 1, category_id: 7, title: 'はじめに学習したプログラミング言語は何ですか？', description: '私はPythonです！',
             option_1: 'JavaScript', option_2: 'Ruby', option_3: 'Python', option_4: 'その他',
             img_path: 'https://prtimes.jp/i/1348/1873/resize/d1348-1873-724362-2.png')
Vote.create(user_id: 1, topic_id: 24, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 24, chosen_option: 2, age: 30, sex: 'male')
Vote.create(user_id: 4, topic_id: 24, chosen_option: 3, age: 20, sex: 'female')
topic = Topic.find(24)
topic.update(voted_num: 3)
Topic.create(user_id: 1, category_id: 8, title: '稼いだ分そのまま使ってる人ww', description: '私は20代ですが稼いだ給料をそのまま支出してますw',
             option_1: '稼いだ分使ってる', option_2: '貯金してる', option_3: '投資してる',
             img_path: 'https://meaning-book.com/blog-images/1570243627386566.jpg')
Vote.create(user_id: 1, topic_id: 25, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 4, topic_id: 25, chosen_option: 2, age: 20, sex: 'female')
topic = Topic.find(25)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 9, title: '人には言えない趣味を持っている人', description: '私は自分の体毛を抜いて保存するのが趣味です',
             option_1: '人に言えない趣味がある', option_2: '人に言えない趣味はない',
             img_path: 'https://i0.wp.com/cocorolabo.com/wp-content/uploads/2019/10/20191101_01.jpeg?fit=1024%2C768&ssl=1')
Vote.create(user_id: 1, topic_id: 26, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 4, topic_id: 26, chosen_option: 2, age: 20, sex: 'female')
topic = Topic.find(26)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 10, title: 'バンドのパート', description: '皆さんバンドでどのパートですか？',
             option_1: 'ギター', option_2: 'ベース', option_3: 'ドラム', option_4: 'キーボード',
             img_path: 'https://realsound.jp/wp-content/uploads/2020/09/20200929-beck.jpg')
Vote.create(user_id: 1, topic_id: 27, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 27, chosen_option: 2, age: 30, sex: 'male')
Vote.create(user_id: 4, topic_id: 27, chosen_option: 3, age: 20, sex: 'female')
topic = Topic.find(27)
topic.update(voted_num: 3)
Topic.create(user_id: 1, category_id: 11, title: '美容に興味ある男性', description: '男の人に質問です。美容に興味ありますか？　最近はメンズ脱毛とか男のスキンケアとかがメジャーになりつつあるので意識調査です',
             option_1: '興味ある', option_2: '興味ない',
             img_path: 'https://assets.st-note.com/production/uploads/images/52678761/picture_pc_fe28db1baa11b26e59c6b7f1dfcc2a22.jpg',
             sex: 'male')
Vote.create(user_id: 1, topic_id: 28, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 28, chosen_option: 2, age: 30, sex: 'male')
topic = Topic.find(28)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 12, title: '皆さんテレビ見ますか？', description: '20代の人に質問です。私は家にテレビがなくテレビは見ないのですが、皆さんはテレビ見ますか？',
             option_1: '見る', option_2: '見ない',
             img_path: 'https://afpbb.ismcdn.jp/mwimgs/f/a/810wm/img_fad0db421a9f16fbe8550ae7deb854a2247229.jpg',
             age: 20)
Vote.create(user_id: 1, topic_id: 29, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 4, topic_id: 29, chosen_option: 2, age: 20, sex: 'female')
topic = Topic.find(29)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 13, title: 'スノボーの平野歩夢選手めっちゃかっこよくないですか？', description: '北京五輪も平昌五輪もかっこよすぎました！！！',
             option_1: 'かっこいい', option_2: 'それほどでもない',
             img_path: 'https://newsatcl-pctr.c.yimg.jp/r/iwiz-amd/20220209-02091035-sph-000-8-view.jpg?pri=l&w=640&h=608&exp=10800')
Vote.create(user_id: 1, topic_id: 30, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 4, topic_id: 30, chosen_option: 1, age: 20, sex: 'female')
topic = Topic.find(30)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 15, title: 'ずっと真夜中でいい人', description: '私はずっと真夜中が良いです。むしろ、日中が存在している意味がわかりません',
             option_1: 'ずっと真夜中でいい', option_2: 'それは困る',
             img_path: 'https://i.ytimg.com/vi/Atvsg_zogxo/maxresdefault.jpg')
Vote.create(user_id: 1, topic_id: 31, chosen_option: 1, age: 20, sex: 'male')
Vote.create(user_id: 2, topic_id: 31, chosen_option: 1, age: 30, sex: 'male')
Vote.create(user_id: 4, topic_id: 31, chosen_option: 2, age: 20, sex: 'female')
topic = Topic.find(31)
topic.update(voted_num: 3)
Topic.create(user_id: 1, category_id: 16, title: '子育てつらい人', description: '一児の母ですが毎日子育てが大変です……',
             option_1: 'つらい', option_2: 'かわいいが勝つ',
             img_path: 'https://epark.jp/kosodate/wp-content/uploads/2020/01/crying-baby-at-night-e1618298025293.jpg')
Vote.create(user_id: 4, topic_id: 32, chosen_option: 2, age: 20, sex: 'female')
Vote.create(user_id: 4, topic_id: 32, chosen_option: 1, age: 30, sex: 'female')
topic = Topic.find(32)
topic.update(voted_num: 2)
Topic.create(user_id: 1, category_id: 17, title: '日本の未来は明るいと思いますか？', description: '景気低迷・政治不信な現代ですが、皆さんは日本の未来は明るいと思いますか？',
             option_1: '思う', option_2: '思わない',
             img_path: 'https://www.kantei.go.jp/jp/content/20211110daijin01.jpg')
Vote.create(user_id: 2, topic_id: 33, chosen_option: 1, age: 30, sex: 'male')
Vote.create(user_id: 4, topic_id: 33, chosen_option: 2, age: 20, sex: 'female')
topic = Topic.find(33)
topic.update(voted_num: 2)



Comment.create(user_id: 1, topic_id: 1, text: 'やっぱりマリア様がみてる一強か～そうだよね～～ごきげんよう')
Comment.create(user_id: 2, topic_id: 1, text: 'わかる。聖様が好き', parent_id: 1)
Comment.create(user_id: 3, topic_id: 1, text: 'ゆるゆりしか勝たん')
Comment.create(user_id: 1, topic_id: 1, text: '白薔薇いいよね', parent_id: 2)
Comment.create(user_id: 2, topic_id: 1, text: '私は乃梨子派～', parent_id: 2)
Comment.create(user_id: 1, topic_id: 2, text: 'VScode')
Comment.create(user_id: 2, topic_id: 2, text: 'Emax使ったことないんだよね')
Comment.create(user_id: 1, topic_id: 3, text: '大根')
Comment.create(user_id: 2, topic_id: 3, text: '大根ww', parent_id: 8)
Comment.create(user_id: 1, topic_id: 4, text: 'ワイがオタクや')
Comment.create(user_id: 1, topic_id: 5, text: 'ありよりのあり')
Comment.create(user_id: 2, topic_id: 5, text: '願望はあるけど、行動に移せない……')
Comment.create(user_id: 1, topic_id: 6, text: 'NANAはメンヘラの教科書')
Comment.create(user_id: 2, topic_id: 6, text: 'なつかしいね')
Comment.create(user_id: 1, topic_id: 7, text: 'いや、宝鐘マリンでしょ')
Comment.create(user_id: 2, topic_id: 7, text: 'これは宗教戦争の予感w')
Comment.create(user_id: 1, topic_id: 8, text: 'この間接種してきました～')
Comment.create(user_id: 1, topic_id: 9, text: '恋人は二次元ですね')
Comment.create(user_id: 2, topic_id: 9, text: '完全に同意', parent_id: 18)
Comment.create(user_id: 1, topic_id: 10, text: '中学生以下で経験ある人って、世界観中世なのw')
Comment.create(user_id: 2, topic_id: 10, text: '最近は未経験の平均年齢上がってそうね')
Comment.create(user_id: 1, topic_id: 11, text: '投信ってどうなん？')
Comment.create(user_id: 1, topic_id: 12, text: 'まんま私の事で草')
Comment.create(user_id: 1, topic_id: 13, text: 'サブカル系って何？')
Comment.create(user_id: 2, topic_id: 13, text: 'アニソンとかアイドルじゃない？', parent_id: 24)
Comment.create(user_id: 1, topic_id: 14, text: 'このあいだしてきました～')
Comment.create(user_id: 1, topic_id: 15, text: '余裕で毎日')
Comment.create(user_id: 2, topic_id: 15, text: '働く肝臓')
Comment.create(user_id: 1, topic_id: 16, text: '子ども多い方が楽しくない？')
Comment.create(user_id: 2, topic_id: 16, text: '維持コスト高そう')
Comment.create(user_id: 1, topic_id: 17, text: 'まずは自国民でしょ')
Comment.create(user_id: 1, topic_id: 18, text: 'したいけどできない……')
Comment.create(user_id: 2, topic_id: 18, text: '結婚する金がない')
Comment.create(user_id: 1, topic_id: 19, text: 'マガジンのラブコメは至高わかる')
Comment.create(user_id: 2, topic_id: 19, text: 'なんだかんだジャンプじゃん？')
Comment.create(user_id: 1, topic_id: 20, text: 'ATMがほしい。毎月給料だけ振り込んでクレメンス')
Comment.create(user_id: 1, topic_id: 21, text: '顔面交換したい')
Comment.create(user_id: 2, topic_id: 21, text: 'ローソンで売ってんじゃね', parent_id: 37)
Comment.create(user_id: 1, topic_id: 21, text: 'アンパンマンじゃねぇんだよなw', parent_id: 38)
Comment.create(user_id: 1, topic_id: 22, text: 'なにこのお題w')
Comment.create(user_id: 1, topic_id: 23, text: '陰キャ主席です')
Comment.create(user_id: 1, topic_id: 23, text: 'ドヒドイデww')
Comment.create(user_id: 1, topic_id: 24, text: '君に決めたっ！')
Comment.create(user_id: 2, topic_id: 24, text: 'C言語。メモリ管理しなくてプログラミングと言えるのか')
Comment.create(user_id: 1, topic_id: 25, text: 'わかるw')
Comment.create(user_id: 1, topic_id: 26, text: '夏目漱石は原稿に自分の髭付けてたんだっけ？')
Comment.create(user_id: 1, topic_id: 27, text: 'ボーカルです')
Comment.create(user_id: 1, topic_id: 28, text: '韓国トピやん')
Comment.create(user_id: 1, topic_id: 29, text: 'NHKにテレビないですって言うてますw')
Comment.create(user_id: 1, topic_id: 30, text: 'わかる。超かっこいいよね')
Comment.create(user_id: 1, topic_id: 31, text: 'ずっと真夜中でいい。学校行くの嫌')
Comment.create(user_id: 2, topic_id: 31, text: 'コロナ賛成派やん', parent_id: 51)
Comment.create(user_id: 1, topic_id: 32, text: '夜中に寝れないのがほんとうにつらい')
Comment.create(user_id: 1, topic_id: 33, text: 'テクノロジーは米中2強だし詰んでる')

Like.create(user_id: 1, comment_id: 1)
Like.create(user_id: 1, comment_id: 4)
Like.create(user_id: 2, comment_id: 3)
Like.create(user_id: 3, comment_id: 3)
Like.create(user_id: 4, comment_id: 3)
Like.create(user_id: 1, comment_id: 6)
Like.create(user_id: 1, comment_id: 11)
Like.create(user_id: 1, comment_id: 13)
Like.create(user_id: 1, comment_id: 16)
Like.create(user_id: 1, comment_id: 18)
Like.create(user_id: 1, comment_id: 23)
Like.create(user_id: 1, comment_id: 28)
Like.create(user_id: 1, comment_id: 39)
Like.create(user_id: 1, comment_id: 41)
Like.create(user_id: 1, comment_id: 42)
Like.create(user_id: 1, comment_id: 49)
Like.create(user_id: 1, comment_id: 50)
Like.create(user_id: 1, comment_id: 52)

