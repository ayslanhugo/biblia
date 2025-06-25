# app/controllers/chapters_controller.rb

class ChaptersController < ApplicationController
  def show
  @chapter = Chapter.find(params[:id])
  @book = @chapter.book
  @verses = @chapter.verses.order(:number).includes(notes: :user, favorite_verses: :user)

  # Encontra o capítulo anterior dentro do mesmo livro
  @previous_chapter = @book.chapters.where("number < ?", @chapter.number).order(:number).last

  # Encontra o próximo capítulo dentro do mesmo livro
  @next_chapter = @book.chapters.where("number > ?", @chapter.number).order(:number).first

    # --- FIM DA NOVA LÓGICA DE NAVEGAÇÃO ---
  end
end
