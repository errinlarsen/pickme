Feature: The list page
  As an interested gamer
  In order to familiarize myself with the options
  I want to veiw all the picker cards at once

  Background: Picker cards
    Given the following picker cards exist:
      | name | description                            |
      | Foo  | The player who has foo should go first |
      | Bar  | The player who has bar should go first |

  Scenario: View list page
    Given I am on the landing page
    When I click "List"
    Then I should see a standard layout
    And I should see a list of picker cards
    And I should see a picker card named "Foo" with description:
      """
      The player who has foo should go first
      """
    And I should see a picker card named "Bar" with description:
      """
      The player who has bar should go first
      """
