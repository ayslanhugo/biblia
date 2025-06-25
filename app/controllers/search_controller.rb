# app/controllers/search_controller.rb
class SearchController < ApplicationController
  def index
    @query = params[:query]

    if @query.present?
      # ILIKE é case-insensitive (não diferencia maiúsculas de minúsculas)
      # includes(chapter: :book) otimiza a busca para evitar múltiplas queries
      # limit(100) previne resultados excessivos e melhora a performance
      @verses = Verse.where("text ILIKE ?", "%#{@query}%")
                     .includes(chapter: :book)
                     .order("books.id, chapters.number, verses.number")
                     .limit(100)
    else
      # Se a busca estiver vazia, não mostramos nenhum resultado
      @verses = []
    end
  end
end
