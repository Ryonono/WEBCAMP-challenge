class BooksController < ApplicationController

  def index
    @books = Book.all
    @book_new = Book.new
    #@book = @user.book
    #@book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @book_new = Book.new(book_params)
    @user = current_user
    if @book_new.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
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
