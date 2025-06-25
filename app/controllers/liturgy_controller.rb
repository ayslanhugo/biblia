# app/controllers/liturgy_controller.rb
class LiturgyController < ApplicationController
  # Renomeamos a ação para 'show'
  def show
  if params[:date].present?
    begin
      # Primeiro, tentamos converter a string de data (ex: "2025-06-21") num objeto de Data
      selected_date = Date.parse(params[:date])

      # Depois, passamos os 3 argumentos corretos para o nosso serviço
      @liturgy = LiturgyApiService.fetch_for_date(selected_date.day, selected_date.month, selected_date.year)
    rescue Date::Error
      # Se a data for inválida (ex: "231123"), o .parse falha e este bloco é executado
      @liturgy = LiturgyApiService.fetch_today
      flash.now[:alert] = "Formato de data inválido. Por favor, use o calendário."
    end
  else
    # Se nenhuma data for fornecida, busca a de hoje
    @liturgy = LiturgyApiService.fetch_today
  end

  # Lógica de erro para a resposta da API
  if @liturgy.nil? || @liturgy.key?("erro")
    flash.now[:alert] = @liturgy ? @liturgy["erro"] : "Não foi possível carregar a liturgia."
    @liturgy = nil
  end
end
end
