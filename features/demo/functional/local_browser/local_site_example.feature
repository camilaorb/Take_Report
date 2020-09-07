@offline
Feature: Browser - Local Site Example

  Scenario: Verifying elements on a web page
    Given I navigate to the homepage
    Then I can see the Test Evolve logo
    And the page header text is "Test Evolve Test Page"

  Scenario: Using Test Evolve page object model to fill in a simple form
    Given I navigate to the forms page
    When I enter test data in all of the required details into the form
    And I submit the form data
    Then the form submission confirmation page is displayed

  Scenario: Filling in a form with data from a step
    Given I navigate to the forms page
    When I enter the following data into the form
      | First Name | Last Name | Description                        |
      | Santa      | Claus     | a portly, jolly, white-bearded man |
    And I submit the form data
    Then the form submission confirmation page is displayed

  Scenario Outline: Running the same scenario with lots of data-sets
    Given I navigate to the forms page
    When I enter the following data into the form
      | First Name   | Last Name   | Description   |
      | <First Name> | <Last Name> | <Description> |
    And I submit the form data
    Then the form submission confirmation page is displayed
    Examples:
      | First Name | Last Name | Description                                                                                                    |
      | Mickey     | Mouse     | Typically wears red shorts, large yellow shoes, and white gloves                                               |
      | Donald     | Duck      | White duck with a yellow-orange bill, legs, and feet. He typically wears a sailor shirt and cap with a bow tie |
      | Goofy      |           | Dog who typically wears a turtle neck and vest, with pants, shoes, white gloves, and a tall hat                |
      | Minnie     | Mouse     | Sweet in nature, fun-loving and very beautiful                                                                 |

  Scenario: Using Test Evolve page object model to fill in an advanved form
    Given I navigate to the forms page
    When I enter test data in all of the required details into the advanced form
    And I submit the form data
    Then the form submission confirmation page is displayed
    