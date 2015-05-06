Rails.application.routes.draw do
  get 'photos/destroy'

  namespace :api do
    resources :todos
  end
  resources :lists
  resources :todos
  resources :photos, only: [:destroy]
end
