# db/seeds/03_admin_user.seeds.rb

puts "--------------------------------------------------"
puts "==> Verificando e atualizando utilizador Admin..."

# Defina o e-mail e a senha do seu administrador aqui.
ADMIN_EMAIL = "admin@master.com"
ADMIN_PASSWORD = "kJKSZPJ1060@" # Use uma senha forte e segura
# wH9PiNxRPVzFsX7
# Procura pelo utilizador pelo e-mail.
# Se não o encontrar, inicializa um novo objeto User.
admin_user = User.find_or_initialize_by(email: ADMIN_EMAIL)

# Define/Atualiza a senha e a confirmação da senha.
# Isto garante que, mesmo que o utilizador já exista, a sua senha
# será atualizada para a que está definida aqui.
admin_user.password = ADMIN_PASSWORD
admin_user.password_confirmation = ADMIN_PASSWORD

# Define a permissão de administrador como verdadeira.
admin_user.admin = true

# Se você estiver a usar o módulo :confirmable do Devise, 
# descomente a linha abaixo para que não precise de confirmar o e-mail.
# admin_user.skip_confirmation! 

# Salva o utilizador. O 'save!' irá causar um erro se algo falhar,
# o que é bom para depuração.
admin_user.save!

puts "==> O utilizador '#{admin_user.email}' agora é um administrador com a senha atualizada."
puts "--------------------------------------------------"