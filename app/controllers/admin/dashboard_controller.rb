class Admin::DashboardController < ApplicationController
  before_action :authenticate

  def show
    @num_of_products = Product.count
    @num_of_categories = Category.count
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["ADMIN_AUTH_USERNAME"] && password == ENV["ADMIN_AUTH_PASSWORD"]
    end
  end

end
