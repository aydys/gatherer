require 'selenium/webdriver'

Capybara.register_driver :headless_selenium_chrome_in_container do |app|
  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    url: 'http://selenium_chrome:4444/wd/hub',
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w(headless disable-gpu) }
    )
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :headless_selenium_chrome_in_container
    Capybara.server_host = '0.0.0.0'
    Capybara.server_port = 4000
    Capybara.app_host = "http://web:4000"
  end
end

require 'capybara-screenshot/rspec'
