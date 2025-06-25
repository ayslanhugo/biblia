# app/controllers/challenges_controller.rb

# Garanta que o nome da classe é ChallengesController (plural)
class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
    @challenge_days = @challenge.challenge_days.order(:day_number)

    # Esta lógica é para os botões "Iniciar Desafio" e para a Barra de Progresso
    if user_signed_in?
      @user_challenge = current_user.user_challenges.find_by(challenge: @challenge)

      # Se o utilizador iniciou o desafio, calcula o progresso
      if @user_challenge
        total_days = @challenge.challenge_days.count
        completed_days = @user_challenge.user_challenge_days.count

        # Calcula a percentagem
        @progress_percentage = total_days > 0 ? (completed_days.to_f / total_days * 100).round : 0
      end
    end
  end
end
# Note: Este controller é responsável por listar todos os desafios e mostrar detalhes de um desafio específico.
