# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
  layout "admin"
  # Garante que o utilizador está logado
  before_action :authenticate_user!
  # Garante que o utilizador é um administrador
  before_action :authorize_admin!

  private

  def authorize_admin!
    # Redireciona para a página inicial se o utilizador não for admin
    redirect_to root_path, alert: "Acesso não autorizado." unless current_user.admin?
  end
end
