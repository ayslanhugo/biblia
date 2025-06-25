class Note < ApplicationRecord
  belongs_to :user
  belongs_to :verse

  # Validações existentes
  validates :user_id, presence: true
  validates :verse_id, presence: true
  validates :content, presence: { message: "não pode ficar em branco." }

  validates :content, length: {
    maximum: 50,
    too_long: "não pode ter mais de %{count} caracteres."
  }
end
