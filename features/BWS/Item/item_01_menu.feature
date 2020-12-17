Feature: BWS Item Menu

  @BWS-MENU-01
  Scenario: review a list of Items
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When the assistant buyer finish
    Then the buyer can open RMS

  @bws-iv-02
  Scenario: Add Existing Item
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When  the assistant buyer is able to enter Item
    Then the Item is created

  @bws-dashboard-03
  Scenario: Copy From Existing Item(1/2)
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When  the Assistant Buyer manually adds an Item
    And select Manual create Packs Item
    Then the Item is created

  @bws-dashboard-03
  Scenario: Copy From Existing Item(2/2)
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When  the Assistant Buyer manually adds an Item
    And select Auto create Packs Item
    Then the Item is created

  @item-05
  Scenario: Create Order
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When  the Assistant Buyer manually adds an Item
    And select Auto create Packs Item
    Then the Item is created

  @item-05
  Scenario: Approve Order
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When  the Assistant Buyer manually adds an Item
    And select Auto create Packs Item
    Then the Item is created

  @item-04
  Scenario: Verify RMS
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When  the Assistant Buyer manually adds an Item
    And select Auto create Packs Item
    Then the Item is created



  @item-03
  Scenario: Item Tab
    Given the Assistant Buyer on Item tab
    When  the assistant buyer is able to enter Item details
    Then the Assistant Buyer is able to move to the next tab

  @item-04
  Scenario: Item Tab - Swing Tag
    Given an Assistant Buyer on item create tab
    When the assistant buyer selects the 'Green Plus' button located next to the 'Swing Tag' field
    Then the assistant buyer is able to enters more then 3 swing tag

  @item-05
  Scenario: Item Tab - Enter Expenses
    Given an Assistant Buyer on item create tab
    When an Assistant Buyer opts to add Expenses
    Then the Expense Type and Component details calculates the expenses which is published in the Expenses field

  @item-06
  Scenario: Item Tab - Enter HTS Code
    Given an Assistant Buyer on item create tab
    When an Assistant Buyer opts to add HTS Code
    Then the user is only able to add a code from a list of HTS codes

  @item-07
  Scenario: UDA Tab - Add UDA
    Given an Assistant Buyer on item create tab
    When  an assistant buyer opts to add UDA
    Then the user enters more then 3 swing tags

  @item-08
  Scenario: UDA Tab - Add UDA - Style and SKU
    Given an Assistant Buyer on item create tab
    When  an assistant buyer opts to add UDA
    Then the user enters more then 3 swing tags



