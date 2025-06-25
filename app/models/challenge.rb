# app/models/challenge.rb
class Challenge < ApplicationRecord
  has_many :challenge_days, dependent: :destroy

  has_many :user_challenges, dependent: :destroy
  has_many :users, through: :user_challenges
end
