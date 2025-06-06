Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:show]
  resources :shipped_from, only: [:index]
end
