require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Swollocks
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.time_zone = 'Copenhagen'
    config.filter_parameters += [:password]
    config.action_mailer.default_url_options = { :host => 'localhost:3000' }

    config.assets.enabled = true

    config.assets.version = '1.0'

    config.assets.prefix = "/assets"
  end
end
