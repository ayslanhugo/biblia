class UserChallengeDay < ApplicationRecord
  belongs_to :user_challenge
  belongs_to :challenge_day
end
