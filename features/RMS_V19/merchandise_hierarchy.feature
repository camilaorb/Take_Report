Feature: Merchandise Hierarchy

  @MERCH-01
  Scenario: Add one Division
    Given a user is in Merchandise Hierarchy screen
    When they create a new Division where Division ID, Name, Total Market Amounts, Buyer Name and Merchandiser name are mandatory
    Then the new Division is add on the Division table
    #And the Division will be created RMS DB

  @MERCH-02 @critical
  Scenario: Edit Division
    Given a user is in Merchandise Hierarchy screen
    When the user edits the fields Name, Total Market Amounts, Buyer Name and Merchandiser name on a Division
    Then the changes is visible on the Division table
    And the division record will be updated in RMS DB

  @MERCH-03 
  Scenario: Delete Division
    Given a user is in Merchandise Hierarchy screen
    When they delete a Division
    Then the Division is removed from RMS
    And the Division is removed from RMS DB

  @MERCH-04
  Scenario: Add Department
    Given a user is in Merchandise Hierarchy screen
    When they create a new Department where Department, Name and Division are mandatory
    Then the new Department is add on the Department table
    And The Department will be created RMS DB

  @MERCH-05 @critical
  Scenario: Edit Department
    Given a user is in Merchandise Hierarchy screen
    When the user edits the fields Name, Division, Buyer Name and Merchandiser Name on a Department where Name is mandatory
    Then the changes is visible on the Department table
    And The Department will be updated in RMS DB

  @MERCH-06
  Scenario: Delete Department
    Given a user is in Merchandise Hierarchy screen
    When they delete a Department
    Then the Department is removed from RMS
    And The Department is removed from RMS DB

  @MERCH-16
  Scenario: Add Category
    Given a user is in Merchandise Hierarchy screen
    When create a new Category where Category ID and Name are mandatory
    Then the new Category is add on the Category table
    And The Category will be created RMS DB

  @MERCH-17 @critical
  Scenario: Edit Category
    Given a user is in Merchandise Hierarchy screen
    When the user edits the mandatory fields on a Category
    Then the changes is visible on the Category table
    And The Category will be updated in RMS DB

  @MERCH-18
  Scenario: Delete Category
    Given a user is in Merchandise Hierarchy screen
    When they delete a Category
    Then the Category is removed from RMS
    And the Category is on the Daily Purge table to be remove from RMS DB

  @MERCH-19
  Scenario: Add Sub Category
    Given a user is in Merchandise Hierarchy screen
    When create a new Sub Category where Sub Category ID and Name are mandatory
    Then the new Sub Category is add on the Sub Category table
    And The Sub Category will be created RMS DB

  @MERCH-20 @critical
  Scenario: Edit Sub Category
    Given a user is in Merchandise Hierarchy screen
    When the user edits the mandatory fields on a Sub Category
    Then the changes is visible on the Sub Category table
    And the Sub Category will be updated in RMS DB

  @MERCH-21
  Scenario: Delete Sub Category
    Given a user is in Merchandise Hierarchy screen
    When they delete a Sub Category
    Then the Sub Category is removed from RMS
    And the Sub Category is on the Daily Purge table to be remove from RMS DB

  @MERCH-07
  Scenario: Add Sub-Department
    Given a user is in Merchandise Hierarchy screen
    When Create a new Sub-Department by enter the mandatory fields
    Then the new Sub-Department is add on the Sub-Department table
    And The Sub-Department will be created RMS DB

  @MERCH-08 @critical
  Scenario: Edit Sub-Department
    Given a user is in Merchandise Hierarchy screen
    When the user edits the mandatory fields on a Sub-Department
    Then the changes is visible on the Sub-Department table
    And The Sub-Department will be updated in RMS DB

  @MERCH-09
  Scenario: Delete Sub-Department
    Given a user is in Merchandise Hierarchy screen
    When they delete a Sub-Department
    Then the Sub-Department is removed from RMS
    And the Sub-Department is removed from RMS DB

  @MERCH-10
  Scenario: Add VAT Details
    Given a user access a Sub-Department
    When user adds VAT region
    Then VAT regions and VAT codes that are entered at the Sub-Department level become default for items within the Sub-Department

  @MERCH-11 @critical
  Scenario: Edit VAT Details
    Given a user access a Sub-Department
    When user updates VAT region
    Then updates VAT regions and VAT codes that are entered at the Sub-Department level become default for items within the Sub-Department

  @MERCH-12
  Scenario: Delete VAT Details
    Given a user access a Sub-Department
    When user deletes VAT region
    Then VAT regions and VAT codes are delete at the Sub-Department level

  @MERCH-13
  Scenario: Add Merch Hier Defaults
    Given a user access a existent Sub-Department
    When a user adds Default with Information, Category and Sub Category by the Merchandise Hierarchy Default window
    Then the default information for the Sub-Department is created in RMS RMS database only for the Categoryes and Subcategoryes within that Sub-Department

  @MERCH-14 @critical
  Scenario: Edit Merch Hier Defaults
    Given a user access a existent Sub-Department
    When a user update the 'Required' checkbox by setting it to 'Y' by the Merch Hier Default windown
    Then All Items that are set up with the Sub-Department that has the 'Required' set to 'Y' for an Item Information


  @MERCH-15
  Scenario: Delete Merch Hier Defaults
    Given a user access a existent Sub-Department
    When a user deletes a Merch Hier Default
    Then record is deleted successfully

  @MERCH-22
  Scenario: Add Location
    Given a user has created a Sub-Department
    When a user access Up Charges page
    Then the user is able to add the upcharges to the new location

  @MERCH-23
  Scenario: Add Upcharges
    Given a user has set up a Sub-Department and assigned a from/to combination location
    When a user access Up Charges page
    And user enters the component details , component, Up Charge Group, Component Rate, Per Count, Per Count UOM, Component Currency
    Then the upcharges are associated with the defined location for the new sub-department

  @MERCH-24
  Scenario: Edit Upcharges
    Given a user has set up a Sub-Department and assigned a from/to combination location
    When a user access Up Charges page
    And user updates the component details namely Up Charge Group, Component Rate, Component Currency
    Then the upcharges are updated for the selected location defined for the sub-department

  @MERCH-25
  Scenario: Delete Upcharges
    Given a user has set up a Sub-Department and assigned a from/to combination location
    When a user access Up Charges page
    And opts to Delete the upcharge
    Then the upcharge record are removed for the selected location defined for the sub-department


  @DLYPRG
  Scenario: running dlyprg nightly job
    Given the purge batch process is complete "dlyprg"