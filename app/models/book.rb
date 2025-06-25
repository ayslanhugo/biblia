class Book < ApplicationRecord
  belongs_to :version
  has_many :chapters, dependent: :destroy
end
