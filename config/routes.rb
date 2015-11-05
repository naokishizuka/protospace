Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :users, only: [:edit, :update, :show]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
  resources :tags, only: [:index, :show]

  resources :prototypes, only: [:new, :create, :show, :destroy, :edit, :update] do
    collection do
      get 'newest'
    end
  end

end
