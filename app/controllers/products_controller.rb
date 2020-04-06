class ProductsController < ApplicationController
  # GET /products
  def index
    @products = Product.order(:name)
  end
  # Automagically loads the associated view:
  # app/views/products/index.html.erb

  # GET /products/:id
  def show

  end
end
