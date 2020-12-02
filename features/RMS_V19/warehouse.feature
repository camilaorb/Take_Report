Feature: Warehouse

  @WH-01
  Scenario: Create WareHouse
    Given buyer is on the organisations hierarchy screen
    When buyer create Warehouse with mandatory details
    Then the new Warehouse is add on top of Warehouse table and created RMS


  @WH-02
  Scenario: Create Virtual Warehouse
    Given  a buyer completes the fields and descriptions for a new WH
    When buyer access the virtual wh page
    Then the buyer is able to set-up the virtual WH for the new create physical WH

  @WH-03
  Scenario: Create Warehouse - Address
    Given  a buyer completes the fields and descriptions for a new WH
    When a buyer access the Address page for a wh
    Then the buyer is able to add Address WH for the new create physical WH

