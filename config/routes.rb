Rails.application.routes.draw do

devise_for :users
 root to: 'homes#top'
 get "homes/about"
 resources :books, only: [:create, :index, :show, :destroy]
 
 resources :users, only: [:index, :show, :destroy, :edit]


end
