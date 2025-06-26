# config/application.rb

require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Biblia
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
    config.exceptions_app = self.routes
    config.i18n.default_locale = :'pt-BR'
    config.i18n.available_locales = [:'pt-BR', :en]
  end
end
