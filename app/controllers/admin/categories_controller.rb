class Admin::CategoriesController < ApplicationController
  
  before_action :authenticate

  def index
    #retrieves all records from the Category model,
    #orders them by the name attribute in ascending order.
    @categories = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "Category created!"
    else
      render :new
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["ADMIN_AUTH_USERNAME"] && password == ENV["ADMIN_AUTH_PASSWORD"]
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
