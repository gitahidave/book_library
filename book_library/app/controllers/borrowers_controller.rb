class BorrowersController < ApplicationController
    def show
      @borrower_name = params[:name]
      @borrowings = Borrowing.where(borrower_name: @borrower_name).includes(:book).order(borrowed_at: :desc)
    end
  end