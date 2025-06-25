class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [ :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def create
    @note = current_user.notes.new(note_params)
    verse = Verse.find(note_params[:verse_id])
    chapter = verse.chapter
    if @note.save
      redirect_to chapter_path(chapter, anchor: "verse-#{@note.verse_id}"), notice: "Anotação salva com sucesso."
    else
      redirect_to chapter_path(chapter), alert: "Não foi possível salvar a anotação."
    end
  end

  def edit
    # Esta ação está correta. A sua única função é encontrar a nota
    # e renderizar a view 'app/views/notes/edit.html.erb'.
  end

  def update
    # --- MUDANÇA CRUCIAL AQUI ---
    # Usamos respond_to para lidar com diferentes tipos de pedidos.
    respond_to do |format|
      if @note.update(note_params)
        # Para um pedido normal, redirecionamos (fallback).
        format.html { redirect_to chapter_path(@note.verse.chapter, anchor: "verse-#{@note.verse_id}"), notice: "Anotação atualizada." }

        # Para um pedido Turbo Stream, procuramos por 'update.turbo_stream.erb'.
        format.turbo_stream
      else
        # Se a atualização falhar, re-renderizamos o formulário dentro do modal.
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    chapter = @note.verse.chapter
    @note.destroy
    redirect_to chapter_path(chapter), notice: "Anotação apagada com sucesso.", status: :see_other
  end

  private

  def set_note
    # Corrigido para usar a associação do utilizador atual para mais segurança.
    @note = current_user.notes.find(params[:id])
  end

  def authorize_user!
    # A sua verificação aqui é perfeita.
    redirect_to root_path, alert: "Não autorizado" unless @note.user == current_user
  end

  def note_params
    params.require(:note).permit(:content, :verse_id)
  end
end
