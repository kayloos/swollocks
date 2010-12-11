require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Boersboss
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.time_zone = 'Copenhagen'
    config.filter_parameters += [:password]
  end
end

Sass::Plugin.options[:style] = :compressed
Sass::Plugin.options[:always_update] = true
