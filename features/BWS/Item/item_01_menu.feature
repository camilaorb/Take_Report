Feature: BWS Item Menu

  # This scenario verification of 1. Merge Delivery Drops 2. Reject Item Remains because the Functionality not
  # developed yet
  @BWS-MENU-01
  Scenario: review a list of Items
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When the assistant buyer finish
    Then the buyer can open RMS

    #18/12/2020 Task
  @BWS-MENU-02
  Scenario: Add new ITEM
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When  the 'Item sub-tab' displays within the Item Information section
    Then the assistant Buyer is able add specific details including Item’s merchandise hierarchy, Supplier Site, Country of Sources and Country of Manufacturing, Base Cost and Differentiators


  @BWS-MENU-03
  Scenario: Add ITEM - Add Existing Item
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the assistant buyer selects the Add Existing Item
    Then the buyer will be presented with a pop-up to search from approved Items from RMS


  @BWS-MENU-04
  Scenario: Add ITEM - Copy From Existing Item(1/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the assistant buyer selects the Copy From Existing Item
    Then  the user will be presented with a pop-up to search from approved Items from RMS to Copy From


  @BWS-MENU-05
  Scenario: Add Item - Copy From Existing Item(2/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the assistant buyer selects the Copy From Existing Item
    Then Item ID will be copied form the existing item and Item ID will be automatically generated using ORIN Type

#-> working
  @BWS-MENU-06
  Scenario: Delete ITEM (1/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the buyer selects the Item & Ordering Line using the checkbox and Delete Item (red cross logo) from the menu
    Then the Item & Ordering Line from the worklist will be deleted

  @BWS-MENU-07
  Scenario: Delete ITEM (2/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the buyer selects the Item & Ordering Line using the checkbox and Delete Item (red cross logo) from the menu
    And the Item is on a repeating Purchase Order
    Then  the Item & Ordering Line from the worklist will be  deleted but the Item will "not" be deleted from RMS

  @BWS-MENU-08
  Scenario: Reject ITEM (1/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the buyer review the Item & Ordering Line and selects one or more Item & Ordering line from the worklist
    And selects the Reject button
    Then the Item & Ordering Line will be set to Reject Status and assigned to the assistant buyer with a comment

  @BWS-MENU-09
  Scenario: Reject ITEM (2/2)
    Given a buyer or planner rejects an Item & Ordering Line
    When the assistant buyer has submitted the Item & Ordering Line
    Then a confirmation message pop-up prompting the buyer/planner to Assign to the the assistant buyer coupled with a comments that explains the reasons for rejection

