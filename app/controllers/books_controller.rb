class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
    redirect_to book_path(@book)
    else
      @books = Book.all
      render ("books/index")
    end
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = current_user
    @users = current_user.id
  end

  def edit
   @book = Book.find(params[:id])
   if @book.user == current_user
    render "edit"
    else
    redirect_to books_path(@books)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end