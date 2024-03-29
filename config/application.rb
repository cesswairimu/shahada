require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module Shahada
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #configuring which specs rspec will  generate 
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        routing_specs: false,
        helper_specs: false,
        controller_specs: true,
        request_specs: false
      #generate factories instead of fixtures
        g.fixture_replacement :factory_bot_rails, dir: "spec/factories"
    end
    config.action_mailer.default_url_options = { host: 'localhost:3000' }
    Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
  end
end
