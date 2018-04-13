class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # Creates a new user
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      # Handle a successful save.
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  # Returns an appropriate initialization hash
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end