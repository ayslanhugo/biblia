# db/seeds/01_bible_import.seeds.rb

# Só executa este código se a tabela de Versões estiver vazia, para não re-importar desnecessariamente.
if Version.count == 0
  puts "--------------------------------------------------"
  puts "Iniciando a importação da Bíblia Ave Maria (isto pode demorar)..."
  filepath = Rails.root.join('db', 'data', 'bibliaAveMaria.json')

  unless File.exist?(filepath)
    abort("ERRO: Arquivo 'bibliaAveMaria.json' não encontrado em 'db/data/'. A importação foi cancelada.")
  end

  version = Version.create!(name: "Bíblia Ave Maria", abbrev: "AVE_MARIA")

  json_content = File.read(filepath, encoding: 'bom|utf-8')
  parsed_json = JSON.parse(json_content)
  all_books = parsed_json['antigoTestamento'] + parsed_json['novoTestamento']

  all_books.each do |book_data|
    book = version.books.create!(name: book_data['nome'], abbrev: '')
    print "."

    chapters_data = book_data['capitulos']
    chapters_data.each do |chapter_data|
      chapter = book.chapters.create!(number: chapter_data['capitulo'])
      verses_data = chapter_data['versiculos']
      verses_data.each do |verse_object|
        chapter.verses.create!(number: verse_object['versiculo'], text: verse_object['texto'])
      end
    end
  end
  puts "\n'#{version.name}' importada com sucesso! (#{all_books.length} livros)"
  puts "--------------------------------------------------"
else
  puts "-> Importação da Bíblia já realizada. Pulando."
end
