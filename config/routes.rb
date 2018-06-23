Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # SPAのために全てindexページへルーティングする
  root to: 'home#index'
  get '/about', to: 'home#index'
  get '/post/:id', to: 'home#index'
  get '/new', to: 'home#index'
  get '/login', to: 'home#index'
  get '/mypage', to: 'home#index'
  get '/signup', to: 'home#index'

  get '/auth/:provider/callback' => 'api/sessions#create_oauth'

  namespace :api, format: 'json' do
    resources :users, only: [:create, :update, :destroy] do
      member do
        resources :posts, only: [:index]
      end
    end
    post '/sessions', to: 'sessions#create'
    delete '/sessions', to: 'sessions#destroy'
    resources :posts, only: [:index, :show, :create, :update, :destroy]
    post '/like/post/:post_id', to: 'posts#add_like_num'
  end
end
