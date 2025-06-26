puts "--------------------------------------------------"
puts "==> Verificando e criando utilizador Admin..."

# Defina o e-mail e a senha do seu administrador aqui.
# IMPORTANTE: Use uma senha forte e segura!
ADMIN_EMAIL = "admin@master.com"
ADMIN_PASSWORD = "kJKSZPJ1060@" 

# Procura pelo utilizador. Se ele não existir, cria-o com a senha definida.
admin_user = User.find_or_create_by!(email: ADMIN_EMAIL) do |user|
  user.password = ADMIN_PASSWORD
  user.password_confirmation = ADMIN_PASSWORD
  
  # Se você estiver a usar o módulo :confirmable do Devise, 
  # descomente a linha abaixo para que não precise de confirmar o e-mail.
  # user.skip_confirmation! 
end

# Garante que o atributo 'admin' do utilizador está definido como verdadeiro.
admin_user.update!(admin: true)

puts "==> O utilizador '#{admin_user.email}' agora é um administrador."
puts "--------------------------------------------------"