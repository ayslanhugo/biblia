class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  def completed?
    # Um desafio está completo se o número total de dias do desafio
    # for igual ao número de dias que o utilizador marcou como concluídos.
    # E o desafio deve ter pelo menos um dia.
    total_days = challenge.challenge_days.count
    completed_days = user_challenge_days.count

    total_days > 0 && total_days == completed_days
  end

  has_many :user_challenge_days, dependent: :destroy
end
