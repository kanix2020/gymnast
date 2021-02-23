Rails.application.routes.draw do
  root to: "scores#index"
  resources :scores, only: [:new, :create, :show]
  resources :athletes, only: [:new, :create]
  resources :games, only: [:new, :create]
end
