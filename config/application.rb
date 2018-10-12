require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LibraryDirectory
  class Application < Rails::Application
    # Time Zone
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local 

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.system_tests = nil # don't use minitest

    # CAS
    config.rack_cas.server_url = 'https://ssodev.wvu.edu/cas/'

    # presenters
    config.autoload_paths += %W(#{config.root}/presenters)
    
    # force ssl
    # config.force_ssl = true
  end
end
