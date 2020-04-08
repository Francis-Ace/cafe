class CategoriesController < ApplicationController
  # Get / triggers this action
  def index
    @categories = Category.all
  end
  # Rails automatically loads the associated view:
  # app/view/categories/index.html.erb
  # All @categories var is shared with the view.

  # Get /categories.:id triggers this action
  def show
    @category = Category.find(params[:id])
  end
  # Rails automatically loads the associated view:
  # app/view/categories/show.html.erb
  # All @category var is shared with the view.
end
