# frozen_string_literal: true

require 'selenium-webdriver'
require './poms/base_page'
require_relative 'test_elements'

# Example Google Page Object
class TestPage < BasePage
  include Selenium::WebDriver::Error

  def initialize(driver)
    super
  end

  # Example of waiting for an element to be enabled then typing into
  # an input field then sending the return key
  def search_for(search_term)
    type_into TestElements.search_box, search_term
    type_into TestElements.search_box, :return
  end

  # Example of waiting for an element to be displayed then checking the
  # text of the element based on what is passed
  def search_result_present?(search_result)
    wait_until_displayed TestElements.top_search_result
    text_of(TestElements.top_search_result).include? search_result
  end

  # Example of validating what page the test context is on
  def verify_page?
    current_url.include?('Google')
  end

  def verify_no_element_exists
    find TestElements.none_existant_element
  end

  def verify_hidden_element
    wait_until_displayed TestElements.hidden_element
  end

  def verify_enabled_element
    wait_until_enabled TestElements.disabled_element
  end
end
