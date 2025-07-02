class LiturgyController < ApplicationController
  # Não é necessário fazer login para ver a liturgia
  skip_before_action :authenticate_user!, only: [:show], raise: false

  def show
    date_param = params[:date]
    
    # Usamos o cache do Rails. A chave de cache agora inclui 'v2'
    @liturgy = Rails.cache.fetch("liturgy_v2_#{date_param || 'today'}", expires_in: 12.hours) do
      url = build_api_url(date_param)
      
      begin
        response = HTTParty.get(url, timeout: 10)

        # A V2 retorna um status 200 mesmo em caso de erro, então verificamos o corpo da resposta
        if response.success? && response.parsed_response['erro'].nil?
          response.parsed_response
        else
          log_api_error(response, url)
          nil
        end
      rescue Net::ReadTimeout, Net::OpenTimeout, SocketError, HTTParty::Error => e
        log_network_error(e, url)
        nil
      end
    end

    if @liturgy.nil?
      flash.now[:alert] = "Não foi possível obter a liturgia no momento. O serviço pode estar indisponível ou não há liturgia para esta data."
    end
  end

  private

  # Método atualizado para usar o endpoint V2 e os parâmetros corretos
  def build_api_url(date)
    base_url = "https://liturgia.up.railway.app/v2"
    
    if date.present?
      # Converte a data 'AAAA-MM-DD' para os parâmetros dia, mes, ano
      begin
        parsed_date = Date.parse(date)
        "#{base_url}?dia=#{parsed_date.day}&mes=#{parsed_date.month}&ano=#{parsed_date.year}"
      rescue Date::Error
        # Se a data for inválida, retorna o URL do dia atual
        base_url
      end
    else
      base_url
    end
  end

  def log_api_error(response, url)
    Rails.logger.error "API Error: Failed to fetch liturgy from #{url}. Status: #{response.code}, Body: #{response.body}"
  end

  def log_network_error(error, url)
    Rails.logger.error "Network Error: Failed to connect to #{url}. Error: #{error.class} - #{error.message}"
  end
end
