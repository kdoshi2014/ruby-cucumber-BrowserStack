Feature: BrowserStack Live works
  
Background:
  Given I am opening BrowserStack
  	
Scenario: 
  When I click on "link_text" as "Sign in"
  And I enter email as "email" and password as "password"
  Then I login
  Then I close the local window
  Then I click on the desired browser
  Then I should see the title as "Dashboard"