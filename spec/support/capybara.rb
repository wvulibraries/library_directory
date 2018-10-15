# Capybara.run_server = true
# Capybara.server_host = '0.0.0.0'
# Capybara.server_port = 3001

# Capybara.register_driver :remote_browser do |app|
#   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
#     chromeOptions: { args: %w[headless disable-gpu no-sandbox] }
#   )

#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :remote,
#     url: 'http://selenium:4444/wd/hub',
#     desired_capabilities: capabilities
#   )
# end

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
require "capybara/webkit"

Capybara.javascript_driver = if ENV['JAVASCRIPT_DRIVER'] # can be "selenium" or "webkit"
  ENV['JAVASCRIPT_DRIVER'].to_sym
else
  :webkit # as defult javascript_driver
end

# fail fast
def expect_no_js_errors
  if Capybara.current_driver == :webkit || Capybara.current_driver == :webkit_debug
    expect(page.driver.error_messages).to be_empty
  end
end