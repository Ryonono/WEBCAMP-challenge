class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = book_comments.new(book_comment_params)
    #以下の二つがuserとbookがcommentと同等に繋がっていることを示す
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    @comment.save
    redirect_to book_path(@book.id)
  end

  def destroy
  end

  private

  def book_comment_params
    params.require(book_comment).permit(:comment)
  end

end
