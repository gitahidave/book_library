class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy, :borrow, :return]
  
    def index
      @books = Book.all
    end
  
    def show
      @borrowings = @book.borrowings.order(borrowed_at: :desc)
    end
  
    def new
      @book = Book.new
    end
  
    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to @book, notice: "Book was successfully created."
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @book.update(book_params)
        redirect_to @book, notice: "Book was successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      @book.destroy
      redirect_to books_url, notice: "Book was successfully destroyed."
    end
  
    def borrow
      if @book.update(status: "borrowed")
        @book.borrowings.create(borrower_name: params[:borrower_name], borrowed_at: Time.current)
        redirect_to @book, notice: "Book was successfully borrowed."
      else
        redirect_to @book, alert: "Book could not be borrowed."
      end
    end
  
    def return
      if @book.update(status: "available")
        borrowing = @book.borrowings.where(returned_at: nil).last
        borrowing.update(returned_at: Time.current)
        redirect_to @book, notice: "Book was successfully returned."
      else
        redirect_to @book, alert: "Book could not be returned."
      end
    end
  
    private
  
    def set_book
      @book = Book.find(params[:id])
    end
  
    def book_params
      params.require(:book).permit(:title, :author, :published_year, :status)
    end
  end