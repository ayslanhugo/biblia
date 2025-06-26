# config/application.rb

require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Biblia
  class Application < Rails::Application
    config.load_defaults 8.0

    # Força os componentes do Rails 8 a usarem a base de dados primária.
    config.active_record.writing_role = :primary
    config.active_record.reading_role = :primary
    config.solid_cache.connects_to = { database: { writing: :primary, reading: :primary } }
    config.solid_queue.connects_to = { database: { writing: :primary, reading: :primary } }
    config.solid_cable.connects_to = { database: { writing: :primary, reading: :primary } }

    config.autoload_lib(ignore: %w[assets tasks])
    config.exceptions_app = self.routes
    config.i18n.default_locale = :'pt-BR'
    config.i18n.available_locales = [:'pt-BR', :en]
  end
end
