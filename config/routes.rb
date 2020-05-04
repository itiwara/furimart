Rails.application.routes.draw do
  devise_for :users
  root 'items#new'

  resources :users, only: :show
  resources :my_pages, only: :index
  resources :items, only: [:show, :new, :create]
    resources :comments, only: :create
  resources :categories, only: :show
  resources :brands, only: :index
  resources :credit_cards, only: :new do
    collection do
      post 'pay', to: 'credit_cards#pay'
      delete 'delete', to: 'credit_cards#delete'
      get 'show', to: 'credit_cards#show'
    end
  end
  resources :purchases, only: [:new, :create]
end
