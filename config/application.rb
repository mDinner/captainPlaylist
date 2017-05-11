require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CaptainPlaylist
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  	RSpotify::authenticate("
7933d15b129245a6936beb0980b05a98", "
c352e97d411e4305ba4470bc4c8a5cda")
  end
end

