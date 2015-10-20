Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :login,only: [:index]
end
