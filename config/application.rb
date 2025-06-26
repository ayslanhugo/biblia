require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Biblia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Força os componentes do Rails 8 a usarem a base de dados primária.
    # Isto resolve o erro 'AdapterNotSpecified' em produção.
    config.active_record.writing_role = :primary
    config.active_record.reading_role = :primary
    config.solid_cache.connects_to = { database: { writing: :primary, reading: :primary } }
    config.solid_queue.connects_to = { database: { writing: :primary, reading: :primary } }
    config.solid_cable.connects_to = { database: { writing: :primary, reading: :primary } }

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.exceptions_app = self.routes
  end
end
