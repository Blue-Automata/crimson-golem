Feature: Search for cyberpunk 2077 
 
	Scenario: Verify that you can open google and search for something
	  Given Google Is Opened
      When "Cyberpunk 2077" is searched for
      Then Search results related to "Cyberpunk 2077" are displayed

	Scenario: Verify NoSuchElementError is raised for find
	  Given Google Is Opened
      When "Cyberpunk 2077" is searched for
      Then NoSuchElementError Is Raised

	Scenario: Verify ElementNotInteractable is raised for wait_for_displayed
	  Given Google Is Opened
      When "Cyberpunk 2077" is searched for
	  Then ElementNotDisplayedError Is Raised