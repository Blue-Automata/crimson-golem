# frozen_string_literal: true

# Elements for the Google Search Page Example
class TestElements
  class << self
    def search_box
      { xpath: '//input[@title="Search"]' }.freeze
    end

    def top_search_result
      { css: '#rso .g' }.freeze
    end

    def none_existant_element
      { id: 'does not exist' }.freeze
    end

    def hidden_element
      { xpath: '//div[@id="spch"]' }
    end

    def disabled_element
      { xpath: '' }
    end
  end
end
