# app/controllers/admin/users_controller.rb
class Admin::UsersController < Admin::BaseController
  # Encontra o utilizador antes das ações edit, update e destroy
  before_action :set_user, only: [ :edit, :update, :destroy ]

  def index
    @users = User.all.order(:email)
  end

  def edit
    # a variável @user já é definida pelo set_user
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "Utilizador atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  # Medida de segurança extra para não apagar admins pela interface
  if @user.admin?
    redirect_to admin_users_path, alert: "Contas de administrador não podem ser apagadas."
  else
    @user.destroy
    redirect_to admin_users_path, notice: "Utilizador apagado com sucesso."
  end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # "Strong Parameters" - permite que apenas o campo 'admin' seja modificado através deste formulário
  def user_params
    params.require(:user).permit(:admin)
  end
end
