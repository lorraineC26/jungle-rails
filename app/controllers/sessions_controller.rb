# This is where we create (aka login) and destroy (aka logout) sessions.
class SessionsController < ApplicationController
  def new
  end

  # def create
  #   user = User.find_by(email: params[:email])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_path, notice: 'Logged in successfully!'
  #   else
  #     flash[:error] = 'INVALID email or password!!!'
  #     redirect_to '/login'
  #   end
  # end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      # failure, render login form
      flash[:error] = 'INVALID email or password!!!'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Logged out successfully!'
  end
end
