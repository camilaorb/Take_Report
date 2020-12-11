Feature: Warehouse

  @WH-01
  Scenario: Create WareHouse
    Given buyer is on the organizations hierarchy screen
    When buyer create Warehouse with mandatory details
    Then the new Warehouse is add on top of Warehouse table and created RMS


  @WH-02
  Scenario: Create Virtual Warehouse
    Given  a buyer completes the fields and descriptions for a new WH
    When buyer access the virtual wh page
    Then the buyer is able to set-up the virtual WH for the new create physical WH


  @WH-03
  Scenario: Create Warehouse - Virtual WH - Add Pricing Location - Currency of VWH not equal to Pricing Location
    Given a buyer completes the fields and descriptions for a new WH
    When buyer add currency of VWH not equal to Pricing Location
    Then RMS will create a New Zone for the location with the currency of the new VWH


  @WH-04
  Scenario: Create Warehouse - Virtual WH - Add Pricing Location - Currency of VWH  equal to Pricing Location
    Given a buyer completes the fields and descriptions for a new WH
    When buyer add currency of VWH equal to Pricing Location
    Then RMS will add the VWH to to the existing Zone


  @WH-05
  Scenario: Create Warehouse - Address - Add Address
    Given  a buyer completes the fields and descriptions for a new WH
    When a buyer access the Address page for a wh
    Then the buyer is able to add Address WH for the new create physical WH


  @WH-08
  Scenario: Create Warehouse - Address - Delete Address
    Given  a buyer completes the fields and descriptions for a new WH
    When a buyer access the Address page for a wh
    Then the buyer is able to add Address WH for the new create physical WH


  @WH-11
  Scenario: Manage WH - Edit WH
    Given  buyer is on the organizations hierarchy screen
    When buyer update warehouse with mandatory details
    Then the buyer is able to update WH for the selected physical WH


  @WH-12
  Scenario: Manage WH - Edit Address
    Given  buyer is on the organizations hierarchy screen
    When buyer update address of warehouse with mandatory details
    Then the buyer is able to update WH address for the selected physical WH


  @WH-13
  Scenario: Manage WH - Add Address
    Given  buyer is on the organizations hierarchy screen
    When buyer add address for the created warehouse with mandatory details
    Then the buyer is able to add address for the selected physical WH


  @WH-14
  Scenario: Manage WH - Add Address From Existing
    Given  buyer is on the organizations hierarchy screen
    When buyer add address from existing for the created warehouse with mandatory details
    Then the buyer is able to add address from existing for the selected physical WH


  @WH-15
  Scenario: Manage WH - Delete Warehouse
    Given  buyer is on the organizations hierarchy screen
    When a buyer delete a the Warehouse
    Then the record is removed from the Warehouse table and RMS DB

  @unhappy-sce-01
  Scenario: Add WH - Without Address and VWH
    Given  buyer is on the organizations hierarchy screen
    When buyer opts to create warehouse without mandatory details
    Then the buyer is not able to create WH and can observe Address and VWH error

  @unhappy-sce-02
  Scenario: Add WH - With Existing Warehouse
    Given  buyer is on the organizations hierarchy screen
    When buyer opts to create warehouse without mandatory details
    Then the buyer is not able to create WH and can observe Existing WH error

  @unhappy-sce-03
  Scenario: Manage WH - Delete Virtual WH
    Given  buyer is on the organizations hierarchy screen
    When buyer opts to delete Virtual warehouse of the existing WH
    Then the buyer is not able to Delete WH and can observe the expected error