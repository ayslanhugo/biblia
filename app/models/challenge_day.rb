class ChallengeDay < ApplicationRecord
  belongs_to :challenge

  has_many :user_challenge_days, dependent: :destroy
end
