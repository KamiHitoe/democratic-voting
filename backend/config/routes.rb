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
    resources :users, only: %i[create show update]
    resources :topics, only: %i[index create show update] do
      resources :comments, only: %i[index create show]
    end

    # must need parent table's id
    get 'comments/:topic_id/:replied_comment_id', to: 'comments#search_by_id'
  end
end
