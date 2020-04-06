Rails.application.routes.draw do
  # get 'products/index'
  # get 'products/show'
  # get 'categories/index'
  # get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # GET / => categories#index
  root to: 'categories#index'
  # get 'categories', to: 'categories#index'

  # GET /categories/:id => categories/show, will be know as category_path
  # get 'categories/:id', to: 'categories#show', id: /\d+/, as: 'category'
  resources 'categories', only: %i[index show]


  # Get /products => products#index
  # Get /products/:id => products#show
  # This is the same as the two GET above
  resources 'products', only: %i[index show]
end
