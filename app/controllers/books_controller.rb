class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = User.find_by(id: current_user.id)
    @book = Book.new
  end

  def show
    @pbook = Book.find(params[:id])
  
    @user = User.find_by(id: @pbook.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."  
      redirect_to book_path(@book.id)
    else
      flash.now[:danger]
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save 
     flash[:success] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else 
     @books = Book.all
     flash.now[:danger]
     render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = ""
      redirect_to books_path
    end
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body).merge(user_id: current_user.id)
  end
  
end