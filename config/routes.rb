Rails.application.routes.draw do
  root to: "lists#index"
  get '/hidden/', to: 'lists#hidden', as: 'hidden'
  get '/hidden_todos/:id', to: 'lists#inactive_todos', as: 'inactive_todos'
  namespace :api do
    resources :todos
  end
  resources :lists
  resources :todos
  resources :photos, only: [:destroy]
end
