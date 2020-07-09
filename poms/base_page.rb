# frozen_string_literal: true

# This module contains definitions of classes for all kinds of web elements
# which we might want to interact with. This module also includes the base class
# for web page objects

require 'selenium-webdriver'

# Contains general functions applicable to all page elements.
# Every element shall inherit from this one.
class BasePage
  attr_reader :driver

  include Selenium::WebDriver::Error

  def initialize(driver)
    @driver = driver
    @timeout = 10
  end

  # Error Messages:
  def element_not_displayed_err(locator)
    'Element with locator ( ' + locator.to_s + ' ) is not diplayed!'
  end

  def element_not_enabled_err(locator)
    'Element with locator ( ' + locator.to_s + ' ) is not enabled!'
  end

  def no_such_element_err(locator)
    'Element with locator ( ' + locator.to_s + ' ) does not exist!'
  end

  # Clears input element of text
  def clear(locator)
    return if !wait_until_enabled(locator) && !wait_until_displayed(locator)

    driver.find_element(locator).clear
  end

  # Clicks on element
  def click(locator)
    return if !wait_until_enabled(locator) && !wait_until_displayed(locator)

    driver.find_element(locator).click
  end

  # Finds element with given locator
  # This object can have other base_page methods used in conjuction
  # Example: click()
  def find(locator)
    driver.find_element(locator)
  end

  # Sends text to element, does not necessarily need to be an input element
  def type_into(locator, input)
    return if !wait_until_enabled(locator) && !wait_until_displayed(locator)

    driver.find_element(locator).send_keys input
  end

  # Returns text of element
  def text_of(locator)
    return if !wait_until_enabled(locator) && !wait_until_displayed(locator)

    driver.find_element(locator).text
  end

  # Returns the title of the webpage
  def current_url
    driver.title
  end

  # Navigates browser to url
  def visit(url)
    driver.get(url)
  end

  # Waits for either 10 seconds for block to return result
  def wait_for(seconds: @timeout)
    Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  rescue TimeoutError
    false
  end

  # Returns boolen if element is displayed
  def wait_until_displayed(locator)
    wait_for { driver.find_element(locator).displayed? } ||
      (raise ElementNotInteractableError, element_not_displayed_err(locator))
  end

  # Returns boolean if element that is displayed is enabled
  def wait_until_enabled(locator)
    wait_for { driver.find_element(locator).enabled? } ||
      (raise ElementNotInteractableError, element_not_enabled_err(locator))
  end
end
