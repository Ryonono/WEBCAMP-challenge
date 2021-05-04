class BooksController < ApplicationController

  def index
    @books = Book.all
    @books = @books.page(params[:page]).reverse_order
    @book = Book.new
    #@user = book.user
    #@book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @books = @books.page(params[:page]).reverse_order
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @bookcomment = BookComment.new
    @bookcomments = BookComment.all
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