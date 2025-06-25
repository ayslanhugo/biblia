# app/controllers/books_controller.rb

class BooksController < ApplicationController
  def index
  # Buscamos todos os livros da única versão que temos (Ave Maria), em ordem.
  all_books = Version.first.books.order(:id)

  # A Bíblia Católica tem 46 livros no Antigo Testamento.
  # Pegamos nos primeiros 46 para uma variável.
  @old_testament_books = all_books.first(46)

  # Pegamos nos restantes 27 para outra variável.
  @new_testament_books = all_books.last(27)
end

  def show
    @book = Book.find(params[:id])
    @chapters = @book.chapters.order(:number)
  end
end
