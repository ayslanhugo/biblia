# app/controllers/user_challenge_days_controller.rb
class UserChallengeDaysController < ApplicationController
  before_action :authenticate_user!

  def create
    user_challenge = UserChallenge.find(params[:user_challenge_id])
    # Garante que o utilizador só pode marcar o progresso nos seus próprios desafios
    if user_challenge.user == current_user
      # Marca o dia como concluído (ou encontra o registo se já existir)
      user_challenge.user_challenge_days.find_or_create_by(challenge_day_id: params[:challenge_day_id])
    end
    # Redireciona de volta para a página do desafio
    redirect_to challenge_path(user_challenge.challenge)
  end

  def destroy
    # O ID aqui é o do 'user_challenge_day' a ser apagado
    user_challenge_day = UserChallengeDay.find(params[:id])
    challenge = user_challenge_day.user_challenge.challenge
    # Garante que o utilizador só pode apagar o seu próprio progresso
    user_challenge_day.destroy if user_challenge_day.user_challenge.user == current_user
    redirect_to challenge_path(challenge)
  end
end
