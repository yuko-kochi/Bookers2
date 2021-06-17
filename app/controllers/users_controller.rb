class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all.reverse_order
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    render "edit"
    else
    redirect_to users_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
    else
      render ("users/edit")
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
