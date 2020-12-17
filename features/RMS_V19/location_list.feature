Feature: Location Lists

  @LCL-01
  Scenario: Create Location Lists
    Given a buyer accesses Create Location Lists page
    When the buyer enters the description, comments and region for the list
    Then the buyer can either opt to save the interim details or select more actions and add locations

  @LCL-02
  Scenario: Add Locations
    Given a buyer completes the Location Lists page
    When the Buyer accesses Locations page
    Then the buyer can add the details of the Location

  @LCL-03
  Scenario: Delete Locations
    Given a buyer have added a location to the list
    When the buyer opts to delete the Location from the List
    Then the buyer can remove the location

  @LCL-04
  Scenario: Create Loc List Criteria
    Given accesses the Add Criteria page
    When completes the required details on the page
    Then the buyer can test the SQL to verify that the criteria is valid
    And build the list by selecting the Build List button

  @LCL-05
  Scenario: Amend Loc List Criteria
    Given buyer selects a record in the Location List Criteria page
    When the buyer is able to commit amendments to the Location List
    And test the amendments by test the SQL
    Then the buyer is able to rebuild the list

  @LCL-06
  Scenario: Delete Loc List Criteria
    Given buyer selects a record in the Location List Criteria page
    When the buyer opts to Delete a Location List Criteria
    Then  a confirmation message is displayed prior to deletion

  @LCL-07
  Scenario: Location List Rebuild
    Given a buyer selects a record in the location list criteria page
    When the buyer opts to Rebuild the Location List
    Then the buyer is able to rebuild the list