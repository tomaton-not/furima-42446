Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "items#index"
  resources :items, only: :index
  resources :users, only: [:show]
end
