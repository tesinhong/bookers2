class BookCommentsController < ApplicationController

  def edit
    @book = Book.find(params[:id])
    @book_comment = current_user.book_comments.find(params[:id])
    if @book_comment.user_id != current_user.id
      redirect_to books_path
    end
  end

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    redirect_to book_path(@book.id)
  end

  def update
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.find(params[:id])
    if @book_comment.update(book_comment_params)
      redirect_to book_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      @book.destroy
      redirect_to book_path(@book)
    end
  end

  private
    def book_comment_params
      params.require(:book_comment).permit(:user_id, :book_id, :comment)
    end

end
