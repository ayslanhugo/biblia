# test/models/note_test.rb
require "test_helper"

class NoteTest < ActiveSupport::TestCase
  test "should save valid note" do
    # Usa os "fixtures" para obter um utilizador e um versículo de teste
    user = users(:one)
    verse = verses(:genesis_1_1)

    note = Note.new(content: "Esta é uma anotação válida.", user: user, verse: verse)
    assert note.save, "Não foi possível salvar uma anotação válida"
  end

  test "should not save note without content" do
    user = users(:one)
    verse = verses(:genesis_1_1)

    note = Note.new(user: user, verse: verse) # Sem conteúdo
    assert_not note.save, "Salvou uma anotação sem conteúdo"
  end

  test "should not save note with content longer than 500 characters" do
    user = users(:one)
    verse = verses(:genesis_1_1)
    long_content = "a" * 501 # Cria um texto com 501 caracteres

    note = Note.new(content: long_content, user: user, verse: verse)
    assert_not note.save, "Salvou uma anotação com mais de 500 caracteres"
  end
end
