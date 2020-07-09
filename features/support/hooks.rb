# frozen_string_literal: true

require 'cucumber'
require 'selenium-webdriver'

# Setups up the driver object before a feature file scenario executes
Before  do |_scenario|
  @browser = ENV['BROWSER']
  _platform = ENV['PLATFORM'] # Need to setup functionality for this
  puts @browser
  if @browser == 'chrome'
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    @driver = Selenium::WebDriver.for :chrome, options: options
  elsif @browser == 'firefox'
    options = Selenium::WebDriver::Firefox::Options.new
    @driver = Selenium::WebDriver.for :firefox, options: options
  else
    raise ArgumentError, '@browser was not firefox or chrome'
  end
end

# Tear down for the driver object
After do |scenario|
  if scenario.failed?
    @driver.screenshot.save(scenario.name + '.png')
    embed(scenario.name + '.png', 'image/png')
  end
  @driver&.quit
end
