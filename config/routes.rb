Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :plates, only: [:new, :create]
end
