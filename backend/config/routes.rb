Rails.application.routes.draw do
  # set /v1 as URI prefix
  namespace :v1, format: 'json' do
    resources :todos do
      resources :items
    end
    
    # create related endpoint URI
    resources :users, only: %i[create show update]
    resources :topics, only: %i[index create show] do
      resources :comments, only: %i[index create show]
    end

  end

end
