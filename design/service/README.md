
- concept(こだわり): 「自由と規律の調和」

- mission: 「すべての投票を、民主化したい！」
- why(なぜ作るのか):
  - 人に聞けないようなことを、民主の力で解決する
- what(何を作るのか): 
  - 匿名投票アプリ
- How(どのようにして実現するのか): 
  - 匿名による投票の民主化と通報による治安の自己組織化

# 機能要件

- [x] トピック生成機能
- トピック検索機能(仕様については検討)
  - [x] keyword x period[全期間, 1Y, 1M, 1W]
  - [x] category x period[全期間, 1Y, 1M, 1W]
- カテゴリ機能: num of categories = ?
  - [x] カテゴリ一覧表示機能
- コメント機能
  - [x] コメント機能
  - [x] いいね機能
  - [x] 返信機能(1次元のparent_id方式)
  - [x] ページネーション機能(100comments / page)
- [x] 通報機能
- [ ] 画像投稿機能
- [ ] Twitter連携機能
- ゾーニング機能
  - [x] 性別・年代集計機能
  - [x] 性別・年代限定機能
- [x] グラフ可視化機能
- [ ] 管理者機能(AWSにおいて必要があれば)


# 類似アプリ調査

- ガールズちゃんねる
  - 機能
    - トピック生成機能
      - トピック検索機能
    - タグ機能
    - コメント機能
      - like/dislike機能
      - reply機能
      - ページネーション機能
    - 画像投稿機能
    - 高like 色付け機能
  - 特徴
    - コメント: 古い順, 匿名
    - ユーザ登録: なし
  - comment component
    - id
    - created_at
    - textarea
    - reply
    - like
    - dislike
  - top page component(daily base)
    - search topics
    - trend topics
    - newest topics
  - number of tags: 24
  - path
    - /top
      - /topics/:topics_id/
      - /comment/:topics_id/:comments_id/

- 質問箱(peing)
  - 機能
    - トピック生成機能
    - タグ機能
    - コメント機能
      - like機能
      - コメントログ機能
      - ページネーション機能
    - フォロー機能
    - メッセージ機能
    - 通知機能
    - Twitter連携機能
  - 特徴
    - コメント: 新しい順, ユーザ名
    - ユーザ登録: ID Provider
  - comment component
    // - id
    // - created_at
    - username
    - user icon
    - textarea
    - like
  - top page component(daily base)
    - search topics
    - trend topics
    - newest topics
  - number of tags: 97
  - path
    - /top
      - /tags/:hashed_topics_id/
        - /tags/:hashed_topics_id/?pages=page_id

- みんなの意見(Yahoo)
  - 機能
    - トピック検索機能
    - タグ機能
    - コメント機能
      - like機能
      - reply機能
      - ページネーション機能
    - Twitter連携機能
    - グラフ可視化機能
  - 特徴
    - コメント: 新しい順, ユーザ名
    - ユーザ登録: ID Provider
  - comment component
    // - id
    // - created_at
    - username
    - user icon
    - textarea
    - like(toggle)
    - reply
  - top page component(daily base)
    - search topics
    - trend topics
  - number of tags: 6
  - path
    - /top
      - /tags/:topics_id/
        - page nation: load bar style

- みんなのランキング
  - 機能
    - タグ機能
    - コメント機能
      - like機能
      - ページネーション機能(load bar)
    - 性別・年代絞り込み機能
    - SNS連携機能
    - ランキング機能
  - 特徴
    - コメント: 古い順, ユーザ名
    - ユーザ登録: ID Provider
  - comment component
    // - id
    // - created_at
    - username
    - user icon
    - textarea
    - like(toggle)
  - top page component(tags base)
    - topics by tags
    - trend topics
  - number of tags: 2746
  - path
    - /top
      - /:topics_name/



