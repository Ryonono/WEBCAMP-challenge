class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @user = @book.user
    if @book.save
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def book_params
   params.require(:book).permit(:title, :body)
  end




end
