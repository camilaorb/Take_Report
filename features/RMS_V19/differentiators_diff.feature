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

  @DIFF-27
  Scenario: Delete Diff Group Detail with Items
    Given a user attempts to delete a Diff Group
    When there are Items that use the Diff Group
    Then the user will not be able to remove the Diff Group

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
    # Given a user is in Manage Diff Range screen
    # When user enters the Diff Range details to a existent Range Header
    # Then the Diff Range details is created in RMS and RMS DB

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
    # Given a user is in Create Diff Ratio screen
    # When user enters the relevant Merchandise details, Sub-Department, Category, Sub-Category
    # Then the Diff Ratio is created in RMS and RMS DB

  @DIFF-13 @canceled
  Scenario: Search Diff Ratio
    Given a user is in Manage Diff Ratio screen
    When user enters Ratio the search criteria
    Then the results for the search criteria is displayed in the Results table

  @DIFF-14 @canceled
  Scenario: Maintain Diff Ratio - Create
    # Given a user is in Manage Diff Ratio screen
    # When Search for a diff ratio by using basic or advanced search criteria
    # Then user can create a new Ratio by entering Ratio Description and Merchandise Hierarchy details
    # And the Diff Ratio is created in RMS and RMS DB

  @DIFF-15 @canceled
  Scenario: Maintain Diff Ratio - Edit
    # Given a user is in Differentiator Ratio Search screen
    # When Search for a diff ratio by using basic or advanced search criteria
    # Then user amend the Ratio Description and Merchandise Hierarchy details
    # And the Diff Ratio will be updated in RMS DB

  @DIFF-16
  Scenario: Download Diff Template File
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template |
      | Items | Differentiators |
    Then the buyer is able to view the excel template file from the local directory


  @DIFF-17
  Scenario Outline: Upload Diff Template File
    Given a buyer is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type | template |
      | Items | Differentiators |
    Then user upload the source <file>
    Examples:
      | file |
      | DIFF-17 Upload Diff Template File.ods |

  @DIFF-18
  Scenario: Diff Types - Create
    Given a buyer opts to create a new "Differentiator Type"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Items | Differentiators | DIFF-18 Diff Types - Create.ods |
    Then the Diff Type is created in RMS and RMS DB upon successful upload of the file


  @DIFF-19
  Scenario: Diff Types - Edit
    Given a buyer opts to edit a existing "Differentiator Type"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Items | Differentiators | DIFF-19 Diff Types - Edit.ods |
    Then the Diff Type is updated in RMS and RMS DB upon successful upload of the file

  @Diff-20
  Scenario: Diff Types - Delete
    Given a buyer opts to remove a "Differentiator Types"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Items | Differentiators | DIFF-20 Diff Types - Delete.ods |
    Then the Diff Type is deleted in RMS and RMS DB upon successful upload of the file

  @DIFF-21
  Scenario: Diff IDs - Create
    Given a buyer opts to create a new "Differentiator ID"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Items | Differentiators | DIFF-21 Diff IDs - Create.ods |
    Then the Diff ID is created in RMS and RMS DB upon successful upload of the file

  @DIFF-22
  Scenario: Diff IDs - Edit
    Given a buyer opts to edit a existing "Differentiator ID"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Items | Differentiators | DIFF-22 Diff IDs - Edit.ods |
    Then the Diff ID is updated in RMS and RMS DB upon successful upload of the file

  @Diff-23
  Scenario: Diff IDs - Delete
    Given a buyer opts to remove a "Differentiator IDs"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Items | Differentiators | DIFF-23 Diff IDs - Delete.ods |
    Then the Diff ID is deleted in RMS and RMS DB upon successful upload of the file

  @DIFF-24
  Scenario: DIFF_VALUES - DIFF_IDS - Upload Success
  Given a buyer has uploaded "Diff Template" file successfully
    | template_type | template | file |
    | Items | Differentiators | DIFF-24 DIFF_VALUES - DIFF_IDS - Upload Success.ods |
  When the Buyer accesses Review Status
  Then the Buyer is able to determine the success of the upload by checking the status of the process

  @DIFF-25
  Scenario: DIFF_VALUES - DIFF_IDS - Upload Failure
    Given a buyer has failed to upload a "Diff Template" file
      | template_type | template | file |
      | Items | Differentiators | DIFF-25 DIFF_VALUES - DIFF_IDS - Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @DIFF-26
  Scenario: DIFFS -  DIFF_VALUES - DIFF_IDS -  Re-Upload
    Given a buyer has a "Diff Template" file that has failed to upload
      | template_type | template | file1 | file2 |
      | Items | Differentiators | DIFF-26 DIFF_VALUES - DIFF_IDS - Upload.ods | DIFF-26 DIFF_VALUES - DIFF_IDS - Re-Upload.ods |
    When the buyer is able to view the reason for error
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload






