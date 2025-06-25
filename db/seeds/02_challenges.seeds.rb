# db/seeds/02_challenges.seeds.rb
puts "--------------------------------------------------"
puts "Limpando e recriando todos os Desafios..."

# Limpa desafios antigos para evitar duplicados
Challenge.destroy_all

# --- Desafio 1: Advento ---
puts "--> Criando 'Prepare o Caminho do Senhor'"
advent_challenge = Challenge.create!(
  title: "Prepare o Caminho do Senhor",
  description: "Um desafio diário para se preparar espiritualmente para o Natal, focando na oração, reflexão e atos de bondade.",
  category: "Advento"
)
advent_challenge.challenge_days.create!([
  { day_number: 1, title: "Esperança", content: "Acenda a primeira vela da coroa do Advento e reflita sobre a esperança." },
  { day_number: 2, title: "Profecias", content: "Leia as profecias de Isaías sobre a vinda do Messias." },
  { day_number: 3, title: "Caridade Anônima", content: "Faça um ato de caridade anônimo." },
  { day_number: 4, title: "Oração pelas Famílias", content: "Reze pelas famílias que estarão sozinhas no Natal." },
  { day_number: 5, title: "Carta a Jesus", content: "Escreva uma carta para Jesus, expressando seu amor e gratidão." },
  { day_number: 6, title: "Reconciliação", content: "Participe de uma confissão para se reconciliar com Deus." },
  { day_number: 7, title: "Serviço Comunitário", content: "Ajude a decorar a igreja para o Natal." }
])

# --- Desafio 2: Quaresma ---
puts "--> Criando '40 Dias de Transformação'"
lent_challenge = Challenge.create!(
  title: "40 Dias de Transformação",
  description: "Um desafio quaresmal para aprofundar sua fé através da oração, jejum e esmola.",
  category: "Quaresma"
)
lent_challenge.challenge_days.create!([
  { day_number: 1, title: "Sacrifício", content: "Escolha um sacrifício para oferecer durante a Quaresma." },
  { day_number: 2, title: "Via Sacra", content: "Reze a Via Sacra, meditando sobre o sofrimento de Cristo." },
  { day_number: 3, title: "Doação", content: "Doe roupas ou bens para uma instituição de caridade." },
  { day_number: 4, title: "Reflexão do Evangelho", content: "Leia o Evangelho do dia e reflita sobre como aplicá-lo em sua vida." },
  { day_number: 5, title: "Serviço Familiar", content: "Faça um ato de serviço para alguém em sua família." },
  { day_number: 6, title: "Jejum de Palavras", content: "Abstenha-se de fofocas e palavras negativas." },
  { day_number: 7, title: "Eucaristia", content: "Participe da Missa e receba a Eucaristia." }
])

# --- Desafio 3: Páscoa ---
puts "--> Criando 'Celebrando a Ressurreição'"
easter_challenge = Challenge.create!(
  title: "Celebrando a Ressurreição",
  description: "Um desafio para viver a alegria da Páscoa e compartilhar a mensagem do Evangelho.",
  category: "Páscoa"
)
easter_challenge.challenge_days.create!([
  { day_number: 1, title: "Símbolos Pascais", content: "Decore sua casa com símbolos da Páscoa." },
  { day_number: 2, title: "Confraternização", content: "Convide amigos ou familiares para um almoço de Páscoa." },
  { day_number: 3, title: "Leitura da Ressurreição", content: "Leia os relatos da Ressurreição nos Evangelhos." },
  { day_number: 4, title: "Mensagens de Alegria", content: "Envie mensagens de felicitações a pessoas queridas." },
  { day_number: 5, title: "Visita e Consolo", content: "Visite um doente ou idoso e leve alegria a ele." },
  { day_number: 6, title: "Evangelização", content: "Participe de uma atividade de evangelização em sua comunidade." },
  { day_number: 7, title: "Ação de Graças", content: "Agradeça a Deus pela ressurreição de Jesus e pela esperança da vida eterna." }
])

# --- Desafio 4: Virtudes ---
puts "--> Criando 'Vivendo as Virtudes'"
virtues_challenge = Challenge.create!(
  title: "Vivendo as Virtudes",
  description: "Um desafio mensal para praticar uma virtude específica em sua vida diária.",
  category: "Virtudes"
)
virtues_challenge.challenge_days.create!([
  { day_number: 1, title: "Mês 1: Humildade", content: "Faça um ato de serviço sem esperar reconhecimento." },
  { day_number: 2, title: "Mês 2: Caridade", content: "Doe tempo ou recursos para ajudar os necessitados." },
  { day_number: 3, title: "Mês 3: Paciência", content: "Mantenha a calma em situações estressantes." },
  { day_number: 4, title: "Mês 4: Justiça", content: "Defenda os direitos dos oprimidos." },
  { day_number: 5, title: "Mês 5: Temperança", content: "Modere seus prazeres e evite excessos." },
  { day_number: 6, title: "Mês 6: Fé", content: "Dedique tempo à oração e leitura da Bíblia." },
  { day_number: 7, title: "Mês 7: Esperança", content: "Confie na providência divina em todas as circunstâncias." }
])

# --- Desafio 5: Oração ---
puts "--> Criando 'Aprofundando sua Vida de Oração'"
prayer_challenge = Challenge.create!(
  title: "Aprofundando sua Vida de Oração",
  description: "Um desafio para experimentar diferentes formas de oração e fortalecer sua relação com Deus.",
  category: "Oração"
)
prayer_challenge.challenge_days.create!([
  { day_number: 1, title: "Rezar o Terço", content: "Reze o Terço, meditando sobre os mistérios da vida de Cristo." },
  { day_number: 2, title: "Lectio Divina", content: "Pratique a Lectio Divina, lendo e refletindo sobre um trecho da Escritura." },
  { day_number: 3, title: "Diário de Oração", content: "Escreva um diário de oração, registrando seus pensamentos e sentimentos." },
  { day_number: 4, title: "Oração de Agradecimento", content: "Faça uma oração de agradecimento, reconhecendo as bênçãos de Deus em sua vida." },
  { day_number: 5, title: "Oração pelos que Sofrem", content: "Reze por aqueles que sofrem, pedindo a cura e o consolo de Deus." },
  { day_number: 6, title: "Grupo de Oração", content: "Participe de um grupo de oração em sua comunidade." },
  { day_number: 7, title: "Oração Silenciosa", content: "Dedique um tempo para a oração silenciosa, buscando a presença de Deus em seu coração." }
])

puts "--------------------------------------------------"
puts "-> #{Challenge.count} desafios criados."
puts "-> #{ChallengeDay.count} dias de desafio criados no total."
