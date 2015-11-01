Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :users, only: [:edit, :update, :show]
  resources :prototypes, only: [:new, :create, :show, :destroy, :edit, :update]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
end
