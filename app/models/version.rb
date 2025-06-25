class Version < ApplicationRecord
  has_many :books, dependent: :destroy
end
