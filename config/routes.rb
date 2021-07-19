Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  resources :friendships, only: [ :index,:destroy, :create]
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'friendships#search'
  resources :users, only: [:show]
end
