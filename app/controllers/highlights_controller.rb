# app/controllers/highlights_controller.rb
class HighlightsController < ApplicationController
  before_action :authenticate_user!

  def create
    @highlight = current_user.highlights.new(highlight_params)
    if @highlight.save
      render json: { status: "success", highlight_id: @highlight.id }
    else
      render json: { status: "error", errors: @highlight.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    # Encontra o highlight específico que pertence ao utilizador atual, para segurança
    @highlight = current_user.highlights.find(params[:id])
    @highlight.destroy
    # Responde ao JavaScript que a operação foi um sucesso
    render json: { status: "success" }
  rescue ActiveRecord::RecordNotFound
    # Responde com um erro se o highlight não for encontrado ou não pertencer ao utilizador
    render json: { status: "error", message: "Highlight não encontrado" }, status: :not_found
  end

  private

  def highlight_params
    params.require(:highlight).permit(:verse_id, :start_offset, :end_offset, :color)
  end
end
