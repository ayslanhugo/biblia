# app/controllers/user_challenges_controller.rb

class UserChallengesController < ApplicationController
  # Garante que apenas utilizadores logados podem iniciar um desafio
  before_action :authenticate_user!

  def create
    # Encontra o desafio ao qual o utilizador quer se inscrever
    @challenge = Challenge.find(params[:challenge_id])

    # Cria a 'inscrição' do utilizador no desafio, a menos que já exista.
    # find_or_create_by é um método útil do Rails para evitar duplicados.
    @user_challenge = current_user.user_challenges.find_or_create_by(challenge: @challenge)

    # Redireciona de volta para a página do desafio com uma mensagem de sucesso
    redirect_to challenge_path(@challenge), notice: "Você iniciou o desafio '#{@challenge.title}'! Bom trabalho!"
  end
  def destroy
    # O :id aqui é o do user_challenge, mas vamos encontrá-lo de forma segura
    @challenge = Challenge.find(params[:challenge_id])

    # Encontra a 'inscrição' específica deste utilizador para este desafio
    @user_challenge = current_user.user_challenges.find_by(challenge: @challenge)

    if @user_challenge
      # Apaga a inscrição (e o dependent: :destroy nos modelos apagará o progresso)
      @user_challenge.destroy
      redirect_to challenge_path(@challenge), notice: "A sua inscrição no desafio foi cancelada."
    else
      redirect_to challenge_path(@challenge), alert: "Você não estava inscrito neste desafio."
    end
  end
end
