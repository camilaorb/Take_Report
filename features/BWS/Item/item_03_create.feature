Feature: UDA Tab

  @UDAT-01
  Scenario: UDA Tab - Add UDA
    Given an Assistant Buyer on UDA tab
    When  the assistant buyer is able to enter UDA details
    Then the Assistant Buyer is able to move to the next tab

  @UDAT-02
  Scenario: UDA Tab - Add UDA - Style and SKU
    Given an Assistant Buyer on item create tab
    When  an assistant buyer opts to add UDA
    Then  the UDA cab applied to Style and SKU (Default)

  @UDAT-03
  Scenario: UDA Tab - Add UDA - Style only
    Given an Assistant Buyer on item create tab
    When  an assistant buyer opts to add UDA
    Then  the UDA cab applied to Style and SKU (Default)

  @UDAT-04
  Scenario: UDA Tab - Add UDA - SKU only
    Given an Assistant Buyer on item create tab
    When  an assistant buyer opts to add UDA
    Then the user enters more then 3 swing tags