Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/about', to: 'home#index'
  get '/new', to: 'home#index'

  namespace :api, format: 'json' do
    resource :users, only: [:create, :update, :destroy]
    post '/sessions', to: 'sessions#create'
    delete '/sessions', to: 'sessions#destroy'
    resources :posts, only: [:index, :create]
    post '/like/post/:post_id', to: 'posts#add_like_num'
  end
end
