# LOCAL CAPYBARA
# ============================================================
require 'capybara'

Capybara.run_server = true
Capybara.server_host = '0.0.0.0'
Capybara.server_port = 3001

Capybara.register_driver :remote_browser do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless disable-gpu no-sandbox] }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: 'http://selenium:4444/wd/hub',
    desired_capabilities: capabilities
  )
end

# Capybara.javascript_driver = :remote_browser

# RSpec.configure do |config|
#   config.before(:each) do
#     Capybara.app_host = 'http://rails:3001'
#   end

#   config.after(:each) do
#     Capybara.reset_sessions!
#     Capybara.use_default_driver
#     Capybara.app_host = nil
#   end
# end

# TRAVIS CAPYBARA
# ============================================================
# require 'capybara/webkit'

# Capybara.javascript_driver = :webkit

# Capybara::Webkit.configure do |config|
#   # Enable debug mode. Prints a log of everything the driver is doing.
#   # config.debug = true
#   # Allow pages to make requests to any URL without issuing a warning.
#   config.allow_unknown_urls
#   config.ignore_ssl_errors
#   config.skip_image_loading
#   config.raise_javascript_errors = false
# end

# CIRCLECI CAPYBARA
# ============================================================

