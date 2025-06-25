class Chapter < ApplicationRecord
  belongs_to :book
  has_many :verses, dependent: :destroy
end
