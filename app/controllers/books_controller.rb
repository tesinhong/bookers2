class BooksController < ApplicationController
before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @b_user = @book.user
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = current_user
    @b_user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created!!"
      redirect_to book_path(@book.id)
    else
    p @book.errors.full_messages
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated!"
      redirect_to book_path(@book.id)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      if @book.destroy
        flash[:notice] = "Book was successfully destroy!!"
        redirect_to books_path
      end
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
