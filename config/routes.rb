Rails.application.routes.draw do
  devise_for :users

  root to: 'recipes#index'
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update]
  get 'search', to: 'recipes#search'

  get 'my_recipes', to: 'users#my_recipes'
end