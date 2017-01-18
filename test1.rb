require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for :firefox
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  @driver.get 'https://paars.notarisdossier.nl'
  expect(@driver.title).to eql 'Let op - Notarisdossier'
  @driver.save_screenshot 'headless.png'
end
