class UsersController < ApplicationController
  def index
    @users = User.all
    @book_new = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    #@books = Book.all
    @user_book = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
