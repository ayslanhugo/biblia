Bíblia Sagrada - Aplicação de Estudo Bíblico e Litúrgico
Uma aplicação web completa construída em Ruby on Rails para estudo pessoal da Bíblia Sagrada (Edição Ave Maria) e para o acompanhamento da liturgia diária da Igreja Católica.

📖 Sobre o Projeto
O projeto Bíblia Sagrada nasceu do desejo de criar uma plataforma moderna, acessível e completa para todos aqueles que buscam uma conexão mais profunda com a Palavra de Deus. Desenvolvido por Ayslan Hugo, este site é mais do que um leitor da Bíblia; é um companheiro de jornada espiritual.

A aplicação foi desenhada para ser uma ferramenta pessoal e rica em funcionalidades, com um design moderno e responsivo, incluindo um modo noturno para leituras mais confortáveis.

✨ Funcionalidades Principais
Bíblia Completa: Navegação por Antigo e Novo Testamento, com os 73 livros da edição Ave Maria.

Leitura de Capítulos: Interface de leitura limpa com navegação fácil entre capítulos.

Busca Avançada: Pesquisa por palavras ou frases em todo o texto bíblico.

Sistema de Utilizadores: Registo, login e gestão de perfil com Devise.

Interatividade:

Anotações Pessoais: Adicione, edite e apague anotações para qualquer versículo.

Versículos Favoritos: Marque os seus versículos preferidos para fácil acesso.

Partilha: Partilhe versículos diretamente no WhatsApp.

Liturgia Diária:

Integração com API externa para buscar a liturgia do dia.

Navegação por data com um calendário interativo.

Sistema de cache para otimizar a performance.

Desafios de Leitura:

Participe em desafios temáticos (Quaresma, Advento, etc.).

Marque o seu progresso diário e ganhe "troféus" ao completar os desafios.

Painel de Administração:

Dashboard com estatísticas da aplicação.

Gestão de utilizadores e permissões.

Design Moderno:

Interface totalmente responsiva e amigável para telemóveis.

Modo Noturno (Claro/Escuro) para uma leitura confortável a qualquer hora.

🛠️ Tecnologias Utilizadas
Backend: Ruby on Rails 8

Base de Dados: PostgreSQL

Frontend:

Hotwire (Turbo & Stimulus.js)

Tailwind CSS

Alpine.js

Autenticação: Devise

Deploy: Render

🚀 Como Começar
Para executar este projeto localmente, siga os passos abaixo.

Pré-requisitos
Certifique-se de que tem os seguintes programas instalados:

Ruby (versão 3.3.3, como especificado no .ruby-version)

Bundler (gem install bundler)

PostgreSQL

Instalação
Clone o repositório:

git clone https://github.com/ayslanhugo/biblia.git
cd biblia

Instale as dependências (gemas):

bundle install

Configure a Base de Dados:

Certifique-se de que o seu PostgreSQL está a funcionar.

Edite o arquivo config/database.yml com o seu nome de utilizador e senha para o ambiente de development.

Crie a base de dados:

rails db:create

Execute as Migrações:

rails db:migrate

Popule a Base de Dados (Seeds):
Este comando irá carregar a Bíblia completa e os desafios de exemplo. Pode demorar alguns minutos.

rails db:seed

Inicie o Servidor:

rails s

Agora, abra o seu navegador e visite http://localhost:3000.

🧪 Executando os Testes
Para executar a suite de testes automatizados, use o seguinte comando:

bin/rails test

☁️ Deploy
Esta aplicação está configurada para deploy na plataforma Render. O processo é automatizado através do script render-build.sh. As variáveis de ambiente necessárias (DATABASE_URL, RAILS_MASTER_KEY) precisam de ser configuradas na interface do Render.

🤝 Contribuições
Contribuições são o que tornam a comunidade de open source um lugar incrível para aprender, inspirar e criar. Qualquer contribuição que você fizer será muito bem-vinda.

Se tiver uma sugestão para melhorar o projeto, por favor, faça um "fork" do repositório e crie um "pull request". Você também pode simplesmente abrir uma "issue" com a tag "enhancement".

Faça um Fork do Projeto

Crie o seu Branch de Feature (git checkout -b feature/AmazingFeature)

Faça o Commit das suas Alterações (git commit -m 'Add some AmazingFeature')

Faça o Push para o Branch (git push origin feature/AmazingFeature)

Abra um Pull Request

📄 Licença
Distribuído sob a Licença MIT. Veja LICENSE.txt para mais informações.

📬 Contato
Ayslan Hugo - @ayslanhugo

Link do Projeto: https://github.com/ayslanhugo/biblia
