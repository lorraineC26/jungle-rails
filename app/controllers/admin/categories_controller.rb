class Admin::CategoriesController < ApplicationController
  def index
    #retrieves all records from the Category model,
    #orders them by the name attribute in ascending order.
    @categories = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
  end

end
