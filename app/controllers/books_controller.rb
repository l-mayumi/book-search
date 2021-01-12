class BooksController < ApplicationController
  before_action :authenticate_user!, except: %i[index search]
  before_action :find_books, only: %i[index dashboard]
  before_action :find_book, only: %i[edit update remove]

  def index; end

  def dashboard; end

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

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to dashboard_path
    else
      flash[:alert] = 'Oops, try again!'
      render :edit
    end
  end

  def remove; end

  def destroy
    Book.destroy(params[:id])
    redirect_to :dashboard
  end

  def search
    key = params[:q]
    books = filter_by_author? ? Book.find_author(key) : Book.find_text(key)

    render json: books.sort_by(&:title)
  end

  private

  def find_books
    @books = Book.all.sort_by(&:title)
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author_name, :image)
  end

  def filter_by_author?
    params[:filter] == 'author'
  end
end
