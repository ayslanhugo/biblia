# app/controllers/liturgy_controller.rb

class LiturgyController < ApplicationController
  # Não é necessário fazer login para ver a liturgia
  # skip_before_action :authenticate_user!, only: [:show] # Esta linha foi removida em commits anteriores

  def show
    date_param = params[:date]
    
    @liturgy = Rails.cache.fetch("liturgy_#{date_param || 'today'}", expires_in: 12.hours) do
      url = build_api_url(date_param)
      
      begin
        # Tenta fazer a chamada à API com um timeout de 10 segundos
        response = HTTParty.get(url, timeout: 10)

        if response.success?
          response.parsed_response
        else
          # Se a API devolver um erro, regista-o e retorna nil para não guardar em cache
          log_api_error(response, url)
          nil
        end
      rescue Net::ReadTimeout, Net::OpenTimeout, SocketError, HTTParty::Error => e
        # Se houver um erro de rede, regista-o e retorna nil
        log_network_error(e, url)
        nil
      end
    end

    # Se, após todas as tentativas, a liturgia for nula, mostra uma mensagem de alerta.
    if @liturgy.nil?
      flash.now[:alert] = "Não foi possível obter a liturgia no momento. Por favor, tente novamente mais tarde."
    end
  end

  private

  def build_api_url(date)
    base_url = "https://liturgia.up.railway.app"
    date.present? ? "#{base_url}/#{date}" : base_url
  end

  def log_api_error(response, url)
    # Regista o erro nos logs do Render para podermos depurar
    Rails.logger.error "API Error: Failed to fetch liturgy from #{url}. Status: #{response.code}, Body: #{response.body}"
  end

  def log_network_error(error, url)
    # Regista o erro nos logs do Render para podermos depurar
    Rails.logger.error "Network Error: Failed to connect to #{url}. Error: #{error.class} - #{error.message}"
  end
end
