# frozen_string_literal: true

require 'cucumber'
require 'selenium-webdriver'
require 'rspec/expectations'
require './poms/test_pom/test_page'

Given('Google Is Opened') do
  @driver.get 'https://www.google.com'
  expect(TestPage.new(@driver).verify_page?).to eq true
end

Given('Test Page Is Opened') do
  @driver.get 'https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_option_disabled'
  expect((@driver.title.include? 'w3schools')).to eq true
end

When('{string} is searched for') do |search_term|
  TestPage.new(@driver).search_for(search_term)
end

Then('Search results related to {string} are displayed') do |search_result|
  google_page = TestPage.new(@driver)
  expect((google_page.search_result_present? search_result)).to eq true
end

Then('NoSuchElementError Is Raised') do
  google_page = TestPage.new(@driver)
  expect { google_page.verify_no_element_exists }.to raise_error(
    Selenium::WebDriver::Error::NoSuchElementError
  )
end

Then('ElementNotDisplayedError Is Raised') do
  google_page = TestPage.new(@driver)
  expect { google_page.verify_hidden_element }.to raise_error(
    Selenium::WebDriver::Error::ElementNotInteractableError
  )
end
