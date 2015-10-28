Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :users, only: [:edit,:update,:index]
  resources :protos, only: [:new, :create,:index]
end
