class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(book_comment_params)
    #以下の二つがuserとbookがcommentと同等に繋がっていることを示す
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    @comment.save
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:book_id])
    #book_commentのidとbookのidを両方同時に探す
    @comment =BookComment.find_by(id: params[:id],book_id: params[:book_id])
    @comment.destroy
    redirect_to book_path(@book)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
