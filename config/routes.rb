Rails.application.routes.draw do
  devise_for :users, :controllers => {
    sessions: 'users/sessions'
  } 

  root to: "home#top"

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :plates do
    resources :warehouses, only: [:new, :create]
  end
end
