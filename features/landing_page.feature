Feature: Viewing the landing page
  As a gamer about to play a game
  In order to pick a player to go first in a game
  I want to view a method to pick a starting player

  Scenario: View index page
    Given I am on the landing page
    Then my browser should see appropriate meta tags
    And I should see a standard layout
    And I should see a picker card
