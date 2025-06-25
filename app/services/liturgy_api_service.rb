# app/services/liturgy_api_service.rb

require "httparty"

class LiturgyApiService
  include HTTParty
  base_uri "https://liturgia.up.railway.app/v2"

  def self.fetch_today
    # Gera uma chave de cache única para o dia de hoje, ex: "liturgy-2025-06-21"
    cache_key = "liturgy-#{Date.today.strftime('%Y-%m-%d')}"

    # Tenta buscar do cache. Expira em 12 horas.
    Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      response = get("/")
      handle_response(response)
    end
  end

  def self.fetch_for_date(day, month, year)
    # Gera uma chave de cache única para a data específica
    cache_key = "liturgy-#{year}-#{month}-#{day}"

    Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      response = get("/", query: { dia: day, mes: month, ano: year })
      handle_response(response)
    end
  end

  private

  def self.handle_response(response)
    response.success? ? response.parsed_response : nil
  end
end
