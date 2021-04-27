class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
