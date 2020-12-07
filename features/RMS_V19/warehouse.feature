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


  @WH-09
  Scenario: Edit Warehouse
    Given  buyer is on the organisations hierarchy screen
    When buyer update warehouse with mandatory details
    Then the buyer is able to update WH for the selected physical WH

    ## Working on database verification ##
  @WH-10
  Scenario: Edit Address
    Given  buyer is on the organisations hierarchy screen
    When buyer update address of warehouse with mandatory details
    Then the buyer is able to update WH address for the selected physical WH

  #The test is under review as it is creating a new zone
  # Daniela looking in to the matter
  @WH-11
  Scenario: Add Address
    Given  buyer is on the organisations hierarchy screen
    When buyer add address for the created warehouse with mandatory details
    Then the buyer is able to add address for the selected physical WH

  #The test is under review as it is creating a new zone
  # Daniela looking in to the matter
  @WH-12
  Scenario: Add Address From Existing
    Given  buyer is on the organisations hierarchy screen
    When buyer add address from existing for the created warehouse with mandatory details
    Then the buyer is able to add address from existing for the selected physical WH

  #The test is under review as it is creating a new zone
  # Daniela looking in to the matter
  @WH-13
  Scenario: Delete Warehouse
    Given  buyer is on the organisations hierarchy screen
    When a buyer delete a the Warehouse
    Then the record is removed from the Warehouse table and RMS DB
