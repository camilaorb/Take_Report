Feature: Item Tab

  @item-01
  Scenario: Add a Item
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When  the assistant buyer is able to enter Item
    Then the Item is created

  @item-02
  Scenario: Item Tab
    Given the Assistant Buyer on Item tab
    When  the assistant buyer is able to enter Item details
    Then the Assistant Buyer is able to move to the next tab

  @item-03
  Scenario: Swing Tag
    Given an Assistant Buyer on item create tab
    When the user enters more 3 swing tags
    Then a message is displayed advising user that the limit is 3

  @item-03
  Scenario: Swing Tag - more then 3
    Given an Assistant Buyer on item create tab
    When the user enters more then 3 swing tags
    Then a message is displayed advising user that the limit is 3

  @item-04
  Scenario: Enter Expenses
    Given an Assistant Buyer on item create tab
    When an Assistant Buyer opts to add Expenses
    Then the Expense Type and Component details calculates the expenses which is published in the Expenses field

  @item-05
  Scenario: Enter HTS Code
    Given an Assistant Buyer on item create tab
    When an Assistant Buyer opts to add HTS Code
    Then the user is only able to add a code from a list of HTS codes