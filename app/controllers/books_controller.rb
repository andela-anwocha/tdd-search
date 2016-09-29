class BooksController < ApplicationController
  def home
  end

  def search
    @books = Book.search(search_params[:search])
    render :result
  end

  private

  def search_params
    params.permit(:search)
  end
end
