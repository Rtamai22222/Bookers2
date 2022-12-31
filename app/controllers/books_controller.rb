class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    book = Book.find(params[:id])
    @user = User.find(book.user_id)
    @books = Book.where(id: params[:id])
    # @book_new = Book.new
    @users = User.all
  end

  def edit
  end

  def destroy
  end

  private

  def book_params
     params.require(:book).permit(:title, :body)
  end
end
