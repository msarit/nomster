require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nomster
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.secret_key_base = '<%= ENV["b73a1fd48396cee40e42f3e17c75dd63ff201954666b6e1240143bb123a461674d740d30bae660292f8635e2d1a31cf6bd60d5a3c7514544345dbec58fec79ac"] %>'
  end
end
