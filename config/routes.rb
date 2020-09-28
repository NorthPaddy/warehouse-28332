Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :plates do
    resources :warehouses, only: [:new, :create]
  end
end
