require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'site_prism'
require 'faker'
require 'httparty'

# Capybara.register_driver :selenium do |app|
#   Capybara::Poltergeist::Driver.new(app, js_errors: false)
# end

Capybara.configure do |config|
  config.default_driver = :selenium
end

Capybara.default_max_wait_time = 10
