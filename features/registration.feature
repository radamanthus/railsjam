@user
Feature: Registration
  In order to access members-only features and content
  As a user
  I want to register  

  Scenario: User must be able to register
    Given I am on the new user page
    When I fill in "Name" with "Eumir"
    And I fill in "Login" with "Eumir"
    And I fill in "Email" with "fail.user@test.com"
    And I fill in "Password" with "secret"
    And I fill in "Confirmation" with "secret"
    When I press "Sign up"
    Then a user with login "Eumir" should be created
    And I should see "User"
    
  Scenario: User should NOT be able to register using an email that's been taken
    Given a user with email "taken.email@test.com" exists
    When I go to the new user page
    And I fill in "Name" with "Eumir"
    And I fill in "Login" with "Eumir"             
    And I fill in "Email" with "taken.email@test.com"
    And I fill in "Password" with "secret"
    And I fill in "Confirmation" with "secret"
    And I press "Sign up"
    Then I should see "Email has already been taken"
  
  
  
  
  
  

  
