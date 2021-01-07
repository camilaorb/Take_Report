Feature: BWS Create Item

  @BWS-CREATEITEM-01
  Scenario: Add New Item - Item Tab
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When  the assistant Buyer manually adds an Add New Item to the Buyers Worklist
    Then the assistant Buyer is able add specific details


  @BWS-CREATEITEM-02
  Scenario: Add New Item - Item Tab - Sub-Department
    Given an Assistant Buyer on item create tab
    When  an assistant buyer enters the Sub-Department
    Then  the values listed for the Category are specific for the selected sub-department

  @BWS-CREATEITEM-03
  Scenario: Add New Item - Item Tab - Category
    Given an Assistant Buyer on item create tab
    When  an assistant buyer enters a  the Category using LOV
    Then  the values listed for the sub-category are specific to the selected sub-department and category

  @BWS-CREATEITEM-04
  Scenario: Add New Item - Item Tab - Item Main Description
    Given an Assistant Buyer on item create tab
    When  the assistant buyer enters the Main Description for the Item
    Then the field is limited to 250 Characters

  @BWS-CREATEITEM-05
  Scenario: Add New Item - Item Tab - Marketing Description
    Given an Assistant Buyer on item create tab
    When  the assistant buyer enters the Marketing Description for the Item
    Then the field is limited to 250 Characters

  @BWS-CREATEITEM-06
  Scenario: Add New Item - Item Tab - Supplier Label
    Given an Assistant Buyer on item create tab
    When  an assistant buyer enters description for the Supplier Label
    Then the description must not exceed 15 characters

