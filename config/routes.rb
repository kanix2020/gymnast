Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "users#index"
  resources :users, only: :new 
  resources :scores, only: [:index, :new, :create, :show]
  resources :athletes, only: [:new, :create]
  resources :games, only: [:new, :create]
end
