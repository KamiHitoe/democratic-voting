Rails.application.routes.draw do
  # set /v1 as URI prefix
  namespace :v1, format: 'json' do
    get 'count-likes', to: 'likes#count_likes'
    get 'likes', to: 'likes#show_status'
    post 'likes', to: 'likes#create'
    delete 'likes', to: 'likes#destroy'
    get 'count-votes', to: 'votes#count_votes'
    get 'votes', to: 'votes#show_status'
    post 'votes', to: 'votes#create'
    delete 'votes', to: 'votes#destroy'
    get 'count-report-comments', to: 'report_comments#count_reports'
    get 'report-comments', to: 'report_comments#show_status'
    post 'report-comments', to: 'report_comments#create'
    delete 'report-comments', to: 'report_comments#destroy'
    get 'count-report-topics', to: 'report_topics#count_reports'
    get 'report-topics', to: 'report_topics#show_status'
    post 'report-topics', to: 'report_topics#create'
    delete 'report-topics', to: 'report_topics#destroy'

    # create related endpoint URI
    resources :users, only: %i[index create show update]
    resources :topics, only: %i[index create show update destroy] do
      resources :comments, only: %i[index create show destroy]
    end



    # query paramsを元にtopicsを取得
    get 'search', to: 'topics#search'

    # topic_id, parent comment_idを元に子の返信コメントを全て取得
    get 'comments/:topic_id/:replied_comment_id', to: 'comments#search_by_id'
  end
end
