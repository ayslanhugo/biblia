class StaticPagesController < ApplicationController
  # Não há necessidade de 'skip_before_action' porque o ApplicationController
  # não exige autenticação por defeito. Estas páginas já são públicas.

  def about
    # Esta ação irá renderizar a view 'app/views/static_pages/about.html.erb'
  end

  def contact
    # Esta ação irá renderizar a view 'app/views/static_pages/contact.html.erb'
  end
end
