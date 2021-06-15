class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  private
  def book_params
    params.require(:user).permit(:name, :profile_image, :Introduction)
  end
  
end
