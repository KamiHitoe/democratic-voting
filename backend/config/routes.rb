Rails.application.routes.draw do
  # set /v1 as URI prefix
  namespace :v1, format: 'json' do
    get 'likes/:comment_id', to: 'likes#count_likes'
    get 'likes/:user_id/:comment_id', to: 'likes#check_liked'
    post 'likes/:user_id/:comment_id', to: 'likes#create'
    delete 'likes/:user_id/:comment_id', to: 'likes#destroy'
    get 'votes/:user_id/:topic_id', to: 'votes#check_voted'
    post 'votes/:user_id/:topic_id', to: 'votes#create'
    delete 'votes/:user_id/:topic_id', to: 'votes#destroy'

    # create related endpoint URI
    resources :users, only: %i[index create show update]
    resources :topics, only: %i[index create show update] do
      resources :comments, only: %i[index create show]
    end

    # query paramsを元にtopicsを取得
    get 'search', to: 'topics#search'

    # topic_id, parent comment_idを元に子の返信コメントを全て取得
    get 'comments/:topic_id/:replied_comment_id', to: 'comments#search_by_id'
  end
end
