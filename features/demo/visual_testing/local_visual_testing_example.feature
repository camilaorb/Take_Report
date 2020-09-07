@visual-testing
Feature: Local Visual Testing Demo
  Enable local visual testing in visual_testing.yml and view the report
  generated in the results folder once the scenario is completed
  
  Scenario: No visual checks are performed
    Given I navigate to the homepage
    When I perform no visual check in the scenario
    Then no visual check is displayed in the report
    And the scenario visual test status should be 'skipped'

  Scenario: No baseline exists for a label
    Given I navigate to the homepage
    When I run TestEvolve.visual_check for a label that has no baseline
    Then the new baseline image is displayed in the report
    And the scenario visual test status should be 'skipped'

  Scenario: Visual check matches the baseline for a label
    Given I navigate to the homepage
    And a baseline image exists for label 'main-page'
    When I run TestEvolve.visual_check for label 'main-page' when no visual regressions have occurred
    Then confirmation of a successful visual check is displayed in the report
    And the scenario visual test status should be 'passed'

  Scenario: Visual check fails match against baseline for a label
    Given I navigate to the homepage
    And a baseline image exists for label 'homepage'
    When I run TestEvolve.visual_check for label 'homepage' when visual regressions have occurred
    Then confirmation of a failed visual check is displayed in the report
    And the scenario visual test status should be 'failed'

  Scenario: Visual check matches the baseline for a label but test functionally fails
    Given I navigate to the homepage
    When multiple visual checks occur for different labels where no visual regressions have occurred
    But the test functionally fails and does not complete
    Then confirmation of a successful visual check is displayed in the report
    And the scenario visual test status should be 'error'
    