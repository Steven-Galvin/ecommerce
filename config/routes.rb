Rails.application.routes.draw do
  devise_for :users
  resources :orders do
    resources :order_items
  end

  root to: 'products#index'


  resources :order_items
  resource :cart, only: [:show]
  resources :books

  resources :products do
    resources :order_items
  end
end
