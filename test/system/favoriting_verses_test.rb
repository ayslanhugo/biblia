# test/system/favoriting_verses_test.rb
require "application_system_test_case"

class FavoritingVersesTest < ApplicationSystemTestCase
  setup do
    # O setup faz o login do nosso utilizador de teste antes de cada teste
    @user = users(:one)
    login_as @user, scope: :user
  end

  test "user can favorite and unfavorite a verse" do
    # 1. Visita a página do capítulo
    visit chapter_path(chapters(:genesis_1)) # Supondo um fixture chapters.yml

    # 2. Encontra o botão para favoritar (a estrela vazia) e clica nele
    # Usamos o 'find' para ser mais específico
    find('button[title="Adicionar aos Favoritos"]').click

    # 3. Verifica se a página agora mostra a estrela cheia
    assert_selector 'button[title="Remover dos Favoritos"]'

    # 4. Vai para a página de favoritos
    visit my_favorites_path

    # 5. Verifica se o texto do versículo está na página
    assert_text "No princípio, Deus criou o céu e a terra."

    # 6. Clica em "Remover"
    click_on "Remover"

    # 7. Verifica se a mensagem de "sem favoritos" aparece
    assert_text "Você ainda não marcou nenhum versículo como favorito."
  end
end
