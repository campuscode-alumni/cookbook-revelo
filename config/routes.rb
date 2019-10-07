Rails.application.routes.draw do
  devise_for :users

  root to: 'recipes#index'
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update] do
    # post 'add_to_list', on: :member
    resources :recipe_list_items, only: [:create]
    member do
      post 'approve'
      post 'reject'
    end
  end

  get 'search', to: 'recipes#search'

  get 'my_recipes', to: 'users#my_recipes'
end