Feature: Viewing the landing page
  As a gamer about to play a game
  In order to pick a player to go first in a game
  I want to view a method to pick a starting player

  Background: Picker cards
    Given the following picker cards exist:
      | name | description                            |
      | Foo  | The player who has foo should go first |
      | Bar  | The player who has bar should go first |

  Scenario: View index page
    Given I am on the landing page
    Then the appropriate meta tags should be present
    And I should see a standard layout
    And I should see a picker card named "Foo"
    And I should see the picker card description:
      """
      The player who has foo should go first
      """

  Scenario: Pick another card
    Given I am on the landing page
    When I click on the current card
    Then I should see a picker card name "Bar"
    And I should see the picker card description:
      """
      The player who has bar should go first
      """
