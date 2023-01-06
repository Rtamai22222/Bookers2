class UsersController < ApplicationController
  def index
    @book_new = Book.new
    @user = current_user
    @books = Book.all
    @users = User.all
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    # @books = Book.where(user_id: params[:id])
    @books = @user.books
  end

  def edit
    user = User.find(params[:id])
    if user == current_user
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user =  User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
