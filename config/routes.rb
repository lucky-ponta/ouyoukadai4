Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users

  resources :users
  resources :books
  resource :favorites, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
