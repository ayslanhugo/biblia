# test/models/verse_test.rb

require "test_helper"

class VerseTest < ActiveSupport::TestCase
  # O nome do teste deve descrever o que ele faz.
  test "should return formatted reference in catholic standard format" do
    # PARTE 1: PREPARAÇÃO (Setup)
    # Criamos os dados necessários para o teste em memória.
    # Estes dados não afetam a sua base de dados principal.
    version = Version.create!(name: "Versão Teste")
    book = Book.create!(version: version, name: "João", abbrev: "Jo")
    chapter = Chapter.create!(book: book, number: 3)
    verse = Verse.create!(chapter: chapter, number: 16, text: "Porque Deus amou o mundo...")

    # PARTE 2: EXECUÇÃO
    # Chamamos o método que queremos testar.
    reference = verse.formatted_reference

    # PARTE 3: VERIFICAÇÃO (Assertion)
    # Verificamos se o resultado é o que esperávamos.
    assert_equal "Jo 3,16", reference
  end

  test "should return full book name if abbrev is missing" do
    # Um segundo teste para um caso diferente!
    # PREPARAÇÃO
    version = Version.create!(name: "Versão Teste")
    book = Book.create!(version: version, name: "Apocalipse", abbrev: "") # Abreviação vazia
    chapter = Chapter.create!(book: book, number: 22)
    verse = Verse.create!(chapter: chapter, number: 21, text: "...")

    # EXECUÇÃO
    reference = verse.formatted_reference

    # VERIFICAÇÃO
    assert_equal "Apocalipse 22,21", reference
  end
end
