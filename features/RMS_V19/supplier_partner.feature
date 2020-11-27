Feature: Suppliers and Partners

  @SUP-01
  Scenario: Searching for a Supplier
    Given a buyer access Manage Supplier screen
    When buyer enters Supplier information the search criteria
    Then the results for the Supplier search criteria is displayed in the Results table

  @SUP-02
  Scenario: Supplier - Address
    Given a buyer access Manage Supplier screen
    When a buyer access Suppliers edits page
    Then the buyer is able to amend the details of the Supplier Address

  @SUP-03
  Scenario: Add Supplier Address
    Given a buyer access the Address page for a supplier
    When the buyer add address details
    Then the new Address is add for the Supplier on RMS and RMS DB

  @SUP-04
  Scenario: Edit Supplier Address
    Given a buyer access a existing Address page for a supplier
    When the buyer edit address details
    Then the Address is update for the Supplier on RMS and RMS DB

  @SUP-05
  Scenario: Add From Existing Address Details
    Given a buyer access the Address page for a supplier
    When the buyer opt for 'Add From Existing'
    Then the Address is add for the Supplier on RMS and RMS DB


  @SUP-10
  Scenario: Supplier Site - Inventory Management - Setup of Inventory
    Given a buyer access Manage Supplier screen
    When a buyer access Suppliers Site edits page
    Then buyer is able to create new inventory for the supplier site

  @SUP-11
  Scenario: Supplier Site - Org Unit
    Given a buyer access Manage Supplier screen
    When a buyer access Suppliers Site edits page
    Then buyer is able to view Org Unit that is already setup by Finance
    And buyer is able to opt for the Org Unit for the supplier site

  @SUP-12
  Scenario: Supplier Site - Add Supplier Traits
  Given  a buyer access Manage Supplier screen
  When a buyer access Suppliers Site edits page
  Then buyer is able to select a supplier trait to the Supplier Site

  @SUP-13
  Scenario: Supplier Site - Delete Supplier Traits
    Given  a buyer access Manage Supplier screen
    When a buyer access Suppliers Site edits page
    Then buyer is able to delete a supplier trait to the Supplier Site
    #Verify removal of the traits in RMS

  @SUP-14
  Scenario: Supplier Site - Add Documents
    Given  a buyer access Manage Supplier screen
    When a buyer access Suppliers Site edits page
    Then the buyer is able to create documents for the selected supplier site

  @SUP-15
  Scenario: Supplier Site - Delete Documents
    Given  a buyer access Manage Supplier screen
    When a buyer access Suppliers Site edits page
    Then the buyer is able to remove documents for the selected supplier site

  @SUP-16
  Scenario: Supplier Site - Import Attributes
    Given  a buyer access Manage Supplier screen
    When a buyer access Suppliers Site edits page
    Then the buyer is able to create Import Attributes and Beneficiary Attributes

  @SUP-17
  Scenario: Supplier Site - Expense
    Given  a buyer access Manage Supplier screen
    When a buyer access Suppliers Site edits page
    Then the buyer is able to create expense details by entering Shipping Routes, Expenses and Rate Updates

  @SUP-20
  Scenario: Manage Partner - Create Partner
    Given a buyer access Manage Partners page
    When the buyer add partner details
    Then the new partner is add on RMS and RMS DB

  @SUP-21
  Scenario: Manage Partner - Edit Partner
    Given a buyer access Manage Partners page
    When the buyer edit partner details
    Then the partner is update on RMS and RMS DB

  @SUP-22
    Scenario: Manage Partners - Specifying Invoicing Attributes
    Given a buyer access Manage Partners page
    When a buyer access Invoicing Attributes
    Then the Receive Invoice is save

  @SUP-23
  Scenario: Manage Partners - Add Address Details
    Given a buyer access Manage Partners page
    When the buyer add address details
    Then the new Address is add for the Partner on RMS and RMS DB

  @SUP-24
  Scenario: Manage Partners - Edit Address Details
    Given a buyer access Manage Partners page
    When the buyer edit address details
    Then the Address is update for the Partner on RMS and RMS DB

  @SUP-25
  Scenario: Manage Partners - Add From Existing Address Details
    Given a buyer access the Address page for a partner
    When the buyer opt for 'Add From Existing'
    Then the Address is add for the Partner on RMS and RMS DB

  @SUP-26
  Scenario: Manage Partners - Expense
    Given a buyer access Manage Partners page
    When a buyer access Partners edits page
    Then the buyer is able to create expense details by entering Shipping Routes, Expenses and Rate Updates

  @SUP-27
  Scenario:Manage Partners - Required Documents
    Given  a buyer access Manage Partners page
    When a buyer access Partners edits page
    Then the buyer is able to create documents for the selected Partner

  @SUP-28
  Scenario: Manage Partners - Delete Documents
    Given  a buyer access Manage Partners page
    When a buyer access Partners edits page
    Then the buyer is able to remove documents for the selected Partner