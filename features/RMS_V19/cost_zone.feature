Feature: Cost Zone

  @CZ-01
  Scenario: Cost Zone Group - Create
    Given a user access Cost Zone page
    When the user adds new Cost Zone Group enter Zone Group, Description, Cost Level and Like Group
    Then the Cost Zone Group is created

  @CZ-02
  Scenario: Cost Zone - Create
    Given a user created a Cost Zone Group
    When a user opts to add a Cost Zone to the Cost Zone Group
    Then the Cost Zone is created

  @CZ-03
  Scenario: Cost Zone - Delete
    Given a user access Cost Zone page
    When a user opts to remove a Cost Zone
    Then the record is removed

  @CZ-04
  Scenario: Cost Zone Location - Create
    Given a user opts to add a Cost Zone Location for a Cost Zone
    When the user adds Location and Discharge Port for a selected Zone
    Then the user is able to add the Location to the Cost Zone

  @CZ-05
  Scenario: Cost Zone Location - Edit
    Given a user opts to edit a location for a specific Cost Zone
    When the user select or search for a new zone to move the current location to another zone
    And select or search for another Discharge port
    Then the Cost Zone is update

  @CZ-06
  Scenario: Cost Zone Location - Delete
    Given a user access Cost Zone page
    When a user opts to delete a Location for a selected Cost Zone
    Then the user is able to remove the location for a Cost Zone