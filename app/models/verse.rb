class Verse < ApplicationRecord
  belongs_to :chapter
  has_many :notes, dependent: :destroy
  has_many :favorite_verses, dependent: :destroy

  # Gera a citação formatada no padrão católico (ex: "Gn 1,1")
  def formatted_reference
    # Usa a abreviação do livro se existir, senão o nome completo.
    # .capitalize garante que abreviações como "gn" fiquem "Gn".
    book_abbrev = self.chapter.book.abbrev.presence&.capitalize || self.chapter.book.name

    # Monta a string no formato "Abrev. Capítulo,Versículo"
    "#{book_abbrev} #{self.chapter.number},#{self.number}"
  end
end
