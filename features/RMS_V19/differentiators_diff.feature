Feature: Differentiators

  @DIFF-01
  Scenario: Create New Diff Group
    Given a user is in Differentiator Groups screen
    When they create a Diff Group where Group, Group Description, Type are mandatory
    Then the new Diff Group is add on the top of Diff Group table and created RMS DB

  @DIFF-02 @critical
  Scenario: Edit Diff Group
    Given a user is in Differentiator Groups screen
    When the user is able to update Group Description, Division, Department in RMS
    Then the record is update to the Diff Group table and RMS DB

  @DIFF-03
  Scenario: Delete Diff Group
    Given a user is in Differentiator Groups screen
    When a user delete a the Diff Groups
    Then the record is removed from the Diff Groups table and RMS DB

  @DIFF-04
  Scenario: Add Diff Group Detail
    Given a user is in Differentiator Groups screen
    When a user enter Size in the Group Detail window
    Then a record is created to the Group Detail window and RMS DB

  @DIFF-05 @critical
  Scenario: Edit Diff Group Detail
    Given a user is in Differentiator Groups screen
    When a user update the Sequence in the Group Detail table
    Then the record is update to the Group Detail window and RMS DB

  @DIFF-06
  Scenario: Delete Diff Group Detail
    Given a user is in Differentiator Groups screen
    When a user delete a Group Details
    Then the record is delete on the Diff Group table and RMS DB

  @DIFF-07
  Scenario: Create Diff Range
    Given a user is in Create Diff Range Range screen
    When user enters the Range, Range Type and selects a Diff Type and Group for Diff types 1-3
    Then the Diff Range Header record is created in RMS and RMS DB

  @DIFF-08
  Scenario: Create Diff Range Detail record
    Given user has created the Diff Range Header
    When user enters the Diff Range information
    Then the Diff Range Detail record is created in RMS and RMS DB

  @DIFF-09 @canceled
  Scenario: Create Diff Range Detail
    Given a user is in Manage Diff Range screen
    When user enters the Diff Range details to a existent Range Header
    Then the Diff Range details is created in RMS and RMS DB

  @DIFF-10
  Scenario: Edit Diff Range Detail
    Given a user retrieves the Range Header and Range Details
    When user updates the Diff Range Detail
    Then the Diff Range Detail is updated in RMS and RMS DB

  @DIFF-11
  Scenario: Delete Diff Range Detail
    Given a user retrieves the Range Header and Range Details
    When user deletes the Range Details
    Then the Range Details is removed in RMS and RMS DB

  @DIFF-12 @canceled
  Scenario: Create Diff Ratio
    Given a user is in Create Diff Ratio screen
    When user enters the relevant Merchandise details, Sub-Department, Category, Sub-Category
    Then the Diff Ratio is created in RMS and RMS DB

  @DIFF-13 @canceled
  Scenario: Search Diff Ratio
    Given a user is in Manage Diff Ratio screen
    When user enters Ratio the search criteria
    Then the results for the search criteria is displayed in the Results table

  @DIFF-14 @canceled
  Scenario: Maintain Diff Ratio - Create
    Given a user is in Manage Diff Ratio screen
    When Search for a diff ratio by using basic or advanced search criteria
    Then user can create a new Ratio by entering Ratio Description and Merchandise Hierarchy details
    Then the Diff Ratio is created in RMS and RMS DB

  @DIFF-15 @canceled
  Scenario: Maintain Diff Ratio - Edit
    Given a user is in Differentiator Ratio Search screen
    When Search for a diff ratio by using basic or advanced search criteria
    Then user amend the Ratio Description and Merchandise Hierarchy details
    And the Diff Ratio will be updated in RMS DB

  @DIFF-16
  Scenario: Download Diff Template File
    Given a user is in Download screen
    When user selects Template Type, Template and opts for Download
    Then a excel file is downloaded containing multiple tabs, namely, Diff Types and Diff IDs

  @DIFF-17
  Scenario: Upload Diff Template File
    Given a user is in Upload screen
    When user selects the Template Type and Template which auto populates the Process Description with timestamp
    Then user upload the source file with changes on Diff Type tab for Action, Diff Type and Description

  @DIFF-18
  Scenario: Diff Types - Create
    Given a user is in Download screen
    When user selects Template Type, Template and opts for Download
    Then a excel file is downloaded containing multiple tabs, namely, Diff Types and Diff IDs

  @DIFF-19
  Scenario: Diff Types - Edit
    Given a user is in Upload screen
    When user selects the Template Type and Template which auto populates the Process Description with timestamp
    Then user upload the source file with changes on Diff Type tab for Action, Diff Type and Description


  @Diff-20
  Scenario: Upload Diff IDs Source File
    Given a user is in Upload screen
    When user selects the Template Type and Template which auto populates the Process Description with timestamp
    Then upload the source file with changes on Diff IDs tab for Action, Diff ID, Description and Diff Type