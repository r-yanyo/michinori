Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/about', to: 'home#index'
  get '/new', to: 'home#index'

  namespace :api, format: 'json' do
    resources :posts, only: [:index, :create]
  end
end
