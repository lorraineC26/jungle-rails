class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Account successfully created and logged in!'
    else
      # when params is missing -> back to signup form
      flash[:error] = 'Field missing'
      redirect_to '/signup'
    end
  end

  private

  #sanitize the input from the form
  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :email, 
      :password, 
      :password_confirmation
    )
  end

end
