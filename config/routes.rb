Rails.application.routes.draw do
root to: "lists#index"
  namespace :api do
    resources :todos
  end
  resources :lists
  resources :todos
  resources :photos, only: [:destroy]
end
