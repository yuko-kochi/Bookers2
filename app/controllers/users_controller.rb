class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @books.page(params[:page]).reverse_order
  end
end
