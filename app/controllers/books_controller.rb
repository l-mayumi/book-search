class BooksController < ApplicationController
  before_action :authenticate_user!, except: %i[index search]

  def index
    @books = Book.all
  end

  def dashboard
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to dashboard_path
    else
      flash[:alert] = 'Oops, try again!'
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to dashboard_path
    else
      flash[:alert] = 'Oops, try again!'
      render :edit
    end
  end

  def remove
    @book = Book.find(params[:id])
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to :dashboard
  end

  def search
    books = filter_by_author? ? Book.find_author(params[:q]) : Book.find_text(params[:q])

    render json: books
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :author_name, :image)
  end

  def filter_by_author?
    params[:filter] == 'author'
  end
end
