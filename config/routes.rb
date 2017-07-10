Rails.application.routes.draw do
  devise_for :users
  # resources :orders do
  #   resources :order_items
  # end
  resources :products do
    resources :order_items
  end
end
