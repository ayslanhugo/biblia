class Admin::DashboardController < Admin::BaseController # Garanta que herda do seu controller base de admin
  def show
    @user_count = User.count
    @challenge_count = Challenge.count
    @note_count = Note.count
    @favorite_count = FavoriteVerse.count
    @recent_users = User.order(created_at: :desc).limit(5)
  end
end