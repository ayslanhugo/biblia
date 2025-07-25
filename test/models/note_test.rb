# test/models/note_test.rb
require "test_helper"

class NoteTest < ActiveSupport::TestCase
  # Carrega os dados de exemplo
  fixtures :users, :verses, :chapters, :books, :versions

  # --- MUDANÇA DE SINTAXE ---
  # Usamos 'def test_...' em vez de 'test "..." do' para contornar o bug de carregamento.

  def test_should_save_valid_note
    user = users(:one)
    verse = verses(:genesis_1_1)

    note = Note.new(content: "Anotação válida.", user: user, verse: verse)
    assert note.save, "Não foi possível salvar uma anotação válida"
  end

  def test_should_not_save_note_without_content
    user = users(:one)
    verse = verses(:genesis_1_1)

    note = Note.new(user: user, verse: verse)
    assert_not note.save, "Salvou uma anotação sem conteúdo"
  end

  def test_should_not_save_note_with_content_longer_than_500_characters
    user = users(:one)
    verse = verses(:genesis_1_1)
    long_content = "a" * 501 # Cria um texto com 501 caracteres

    note = Note.new(content: long_content, user: user, verse: verse)
    assert_not note.save, "Salvou uma anotação com mais de 500 caracteres"
  end
end
