Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :plates, only: [:index, :new, :create, :edit, :destroy] do
    resources :warehouses, only: [:new, :create]
  end
end
