Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :users, only: [:edit,:update,:show]
  resources :protos, only: [:new, :create,:show,:destroy,:edit,:update]
end
