Rails.application.routes.draw do

  root to: 'lists#index'
  namespace :api do
    resources :todos, only: [:update]
  end
  resources :lists
  resources :todos, only: [:craete, :edit, :update]
  resources :photos, only: [:destroy]
end
