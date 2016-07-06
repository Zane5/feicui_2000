Rails.application.routes.draw do
  root to: 'pages#front'
  get 'home',         to: 'pages#front'
  get 'register',     to: 'users#new'
  get 'sign_in',      to: 'sessions#new'
  get 'sign_out',     to: 'sessions#destroy'
  get 'my_cart',      to: 'cart_items#index'

  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :cart_items, only: [:create, :destroy]
  post 'buy_immediately', to: 'cart_items#buy_immediately'
   
  resources :products, only: [:show] do
    collection do
      post :search, to: 'products#search'
    end
    resources :reviews, only: [:create]
  end

  resources :vehicle, only: [:show], controller: 'products', type: 'Vehicle' do
    resources :reviews, only: [:create]
  end

  resources :computer, only: [:show], controller: 'products', type: 'Computer' do
    resources :reviews, only: [:create]
  end
end
