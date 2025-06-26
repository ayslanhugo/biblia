# app/controllers/liturgy_controller.rb

class LiturgyController < ApplicationController
  # Cache para guardar os resultados da API e evitar chamadas repetidas
  # O cache expira a cada 12 horas.
  caches_action :show, expires_in: 12.hours, cache_path: -> { request.original_url }

  def show
    date_param = params[:date]
    url = build_api_url(date_param)
    
    begin
      # Tenta fazer a chamada à API
      response = HTTParty.get(url, timeout: 10) # Adicionado timeout de 10 segundos

      if response.success?
        @liturgy = response.parsed_response
      else
        # Se a resposta não for 2xx, regista o erro e prepara uma mensagem
        log_api_error(response, url)
        flash.now[:alert] = "Não foi possível obter a liturgia. O serviço pode estar temporariamente indisponível."
        @liturgy = nil
      end

    rescue Net::ReadTimeout, Net::OpenTimeout, SocketError, HTTParty::Error => e
      # Se ocorrer um erro de rede (timeout, etc.), apanha a excepção,
      # regista o erro e prepara uma mensagem
      log_network_error(e, url)
      flash.now[:alert] = "Ocorreu um erro de comunicação ao buscar a liturgia. Por favor, tente novamente mais tarde."
      @liturgy = nil
    end
  end

  private

  # Método para construir o URL da API
  def build_api_url(date)
    base_url = "https://liturgia.up.railway.app"
    date.present? ? "#{base_url}/#{date}" : base_url
  end

  # Métodos para registar os erros nos logs do Render
  def log_api_error(response, url)
    Rails.logger.error "API Error: Failed to fetch liturgy from #{url}. Status: #{response.code}, Body: #{response.body}"
  end

  def log_network_error(error, url)
    Rails.logger.error "Network Error: Failed to connect to #{url}. Error: #{error.class} - #{error.message}"
  end
end
