Rails.application.routes.draw do

devise_for :users
 root to: 'homes#top'
 get "homes/about"
 resources :books, only: [:create, :index, :show, :edit, :update, :destroy]

 resources :users, only: [:index, :show, :destroy, :edit, :update]


end
