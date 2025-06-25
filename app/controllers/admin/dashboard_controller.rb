class Admin::DashboardController < Admin::BaseController
  def show
    # Aqui podemos adicionar estatísticas no futuro
    @user_count = User.count
    @challenge_count = Challenge.count
  end
end
