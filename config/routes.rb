Rails.application.routes.draw do
  devise_for :users
  resources :orders do
    resources :order_items
  end

  resources :order_items
  resource :cart, only: [:show]

  resources :products do
    resources :order_items
  end
end
