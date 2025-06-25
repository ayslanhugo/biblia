class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notes, dependent: :destroy
  has_many :favorite_verses, dependent: :destroy
  has_many :favorited_verses, through: :favorite_verses, source: :verse
  has_many :user_challenges, dependent: :destroy
  has_many :challenges, through: :user_challenges
end
