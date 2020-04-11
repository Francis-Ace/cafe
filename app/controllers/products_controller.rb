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

  # GET /search/>search_term=user+search+terms
  def search
    @products = Product.where("name LIKE ? AND category_id LIKE ?", "%#{params[:search_term]}%", "%#{params[:search_product]}%").or(Product.where("description LIKE ? AND category_id LIKE ?", "%#{params[:search_term]}%", "%#{params[:search_product]}%"))
  end
end
