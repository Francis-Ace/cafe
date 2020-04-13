Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'products/index'
  # get 'products/show'
  # get 'categories/index'
  # get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # GET / => categories#index
  root to: "categories#index"
  # get 'categories', to: 'categories#index'

  # GET /categories/:id => categories/show, will be know as category_path
  # get 'categories/:id', to: 'categories#show', id: /\d+/, as: 'category'
  resources "categories", only: %i[index show]

  # Get /products => products#index
  # Get /products/:id => products#show
  # This is the same as the two GET above
  resources "products", only: %i[index show]

  get 'search', to: 'products#search', as: 'search' # Known as seach_path

  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
end
