class ProductsController < ApplicationController
  # GET /products
  # The .includes removes the N+1 issue when
  # accessing the student houses in a loop in the view
  def index
    @products = Product.includes(:category).order(:name)
  end
  # Automagically loads the associated view:
  # app/views/products/index.html.erb

  # GET /products/:id   => params[:id]
  def show
    @product = Product.find(params[:id])
  end
  # Automagically loads the associated view:
  # app/views/products/show.html.erb
end