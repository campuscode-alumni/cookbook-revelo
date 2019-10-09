Rails.application.routes.draw do
  devise_for :users

  root to: 'recipes#index'
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update] do
    # post 'add_to_list', on: :member
    resources :recipe_list_items, only: [:create]
    get 'pending', on: :collection
    member do
      post 'approve'
      post 'reject'
    end
  end

  get 'search', to: 'recipes#search'

  get 'my_recipes', to: 'users#my_recipes'

  namespace 'api' do
    namespace 'v1' do
      resources :recipes, only: %i[index show]
    end
  end
end