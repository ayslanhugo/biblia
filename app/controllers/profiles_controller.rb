# app/controllers/profiles_controller.rb
class ProfilesController < ApplicationController
  # Garante que apenas utilizadores logados podem ver o seu perfil
  before_action :authenticate_user!

  def show
  @user = current_user

  # Busca todos os desafios que o utilizador iniciou, já incluindo os dados relacionados
  all_user_challenges = @user.user_challenges.includes(challenge: { challenge_days: :user_challenge_days })

  # O método 'partition' do Ruby é perfeito para dividir a lista em duas
  # com base no resultado do nosso novo método `completed?`
  @completed_user_challenges, @ongoing_user_challenges = all_user_challenges.partition(&:completed?)
  end
end
