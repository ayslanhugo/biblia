# config/routes.rb - Versão Final, Completa e Corrigida

Rails.application.routes.draw do
  get "highlights/create"
  get "profiles/show"
  # 1. Rotas do Sistema de Utilizadores
  devise_for :users

  # 2. Página Principal da Aplicação
  root "books#index"

  # 3. Rotas da Secção da Bíblia e Interações do Utilizador
  resources :books, only: [ :index, :show ]
  resources :chapters, only: [ :show ]
  resources :notes, only: [ :create, :edit, :update, :destroy ]
  resources :favorite_verses, only: [ :create, :destroy ]

  get "meus-favoritos", to: "favorite_verses#index", as: "my_favorites"
  get "meu-perfil", to: "profiles#show", as: "user_profile"

  # 4. Rotas da Secção de Desafios e Progresso
  resources :challenges, only: [ :index, :show ] do
    # Rota aninhada para 'iniciar' ou 'cancelar' um desafio
    resources :user_challenges, only: [ :create, :destroy ]
  end

  # --- ESTA É A LINHA QUE ESTAVA EM FALTA ---
  # Rota para marcar/desmarcar o progresso de um dia
  resources :user_challenge_days, only: [ :create, :destroy ]

  # 5. Rotas da Secção de Administração
  namespace :admin do
    root to: "dashboard#show"
    resources :users, only: [ :index, :edit, :update, :destroy ]
  end

  # 6. Páginas Únicas
  get "liturgia", to: "liturgy#show"
  get "busca", to: "search#index", as: "busca"

  get "sobre", to: "static_pages#about", as: "about"
  get "contato", to: "static_pages#contact", as: "contact"
end
