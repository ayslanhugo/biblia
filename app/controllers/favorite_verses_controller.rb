# app/controllers/favorite_verses_controller.rb
class FavoriteVersesController < ApplicationController
  before_action :authenticate_user!

  # Mostra a lista de versículos favoritos do utilizador atual
  def index
        @favorite_verses = current_user.favorite_verses.includes(verse: :chapter).order(created_at: :desc)
  end

  # Cria um novo favorito
  def create
    verse = Verse.find(params[:verse_id])
    current_user.favorite_verses.create(verse: verse)
    # Redireciona de volta para a página do capítulo, para a âncora do versículo
    redirect_to chapter_path(verse.chapter, anchor: "verse-#{verse.id}")
  end

  # Apaga um favorito
  def destroy
    @favorite_verse = current_user.favorite_verses.find(params[:id])
    @favorite_verse.destroy

    respond_to do |format|
      format.html { redirect_to my_favorites_path, notice: "Versículo removido dos favoritos." }
      format.turbo_stream
    end
  end
end
