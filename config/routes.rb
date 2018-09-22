Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :games, only: %i[index new create]
  get '/history', to: 'games#index'
  get '/log',     to: 'games#new'
end
