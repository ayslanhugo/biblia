#!/usr/bin/env bash
# Sair imediatamente se um comando falhar
set -o errexit

# Instalar todas as gemas
bundle install

# Compilar os "assets" (CSS, JS, etc.)
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Executar as migrações da base de dados
bundle exec rails db:migrate

# Executar os seeds para popular a base de dados (Bíblia, Desafios)
bundle exec rails db:seed