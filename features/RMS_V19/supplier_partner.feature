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
    Given a buyer access a existing Address page for a supplier
    When the buyer opt for 'Add From Existing'
    Then the Address is add for the Supplier on RMS and RMS DB

  @SUP-29
  Scenario: Delete Supplier Address - Secondary Address
    Given a buyer access a existing Address page for a supplier
    When the buyer delete the supplier address that is set up as non-primary
    Then the Address is delete for the Supplier on RMS and RMS DB

  @SUP-30
  Scenario: Delete Supplier Address - Primary Address
    Given a buyer access a existing Primary Address for a supplier
    When the buyer attempt to delete the supplier address that is setup as a Primary Address
    Then the buyer is unable to delete the supplier address

  @SUP-06
  Scenario: Searching for a Supplier Site
    Given a buyer access Manage Supplier screen
    When buyer enters Supplier Site information the search criteria
    Then the results for the Supplier Site search criteria is displayed in the Results table

  @SUP-07
  Scenario: Supplier Site - Add Address
    Given a buyer access the Address page for a supplier site
    When the buyer add address details
    Then the new Address is add for the Supplier Site on RMS and RMS DB

  @SUP-08
  Scenario: Supplier Site - Edit Address
    Given a buyer access a existing Address page for a supplier site
    When the buyer edit address details
    Then the Address is update for the Supplier Site on RMS and RMS DB

  @SUP-09
  Scenario:Supplier Site - Add From Existing Address Details
    Given a buyer access a existing Address page for a supplier site
    When the buyer opt for 'Add From Existing'
    Then the Address is add for the Supplier Site on RMS and RMS DB

  @SUP-31
  Scenario: Supplier Site - Delete Non-Primary Address
    Given a buyer access a existing Address page for a supplier site
    When the buyer delete the supplier site address that is set up as non-primary
    Then the Address is delete for the Supplier Site on RMS and RMS DB

  @SUP-32
  Scenario: Supplier Site - Delete Primary Supplier Address
    Given a buyer access a existing Primary Address for a supplier site
    When the buyer attempt to delete the supplier site address that is setup as a Primary Address
    Then the buyer is unable to delete the supplier site address

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


  #@SUP-14 @canceled
  #Scenario: Supplier Site - Add Documents
  #  Given  a buyer access Manage Supplier screen
  #  When a buyer access Suppliers Site edits page
  #  Then the buyer is able to create documents for the selected supplier site

  #@SUP-15 @canceled
  #Scenario: Supplier Site - Delete Documents
  #  Given  a buyer access Manage Supplier screen
  #  When a buyer access Suppliers Site edits page
  #  Then the buyer is able to remove documents for the selected supplier site

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

  @SUP-09
  Scenario: Manage Partners - Search
    Given a buyer access Manage Partners page
    When buyer enters Partner information the search criteria
    Then the results for the Partner search criteria is displayed in the Results table

  @SUP-20
  Scenario: Manage Partner - Create Partner
    Given a buyer access Create Partners page
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
    Given a buyer access the Address page for a partner
    When the buyer add address details
    Then the new Address is add for the Partner on RMS and RMS DB

  @SUP-24
  Scenario: Manage Partners - Edit Address Details
    Given a buyer access a existing Address page for a partner
    When the buyer edit address details
    Then the Address is update for the Partner on RMS and RMS DB

  @SUP-25
  Scenario: Manage Partners - Add From Existing Address Details
    Given a buyer access a existing Address page for a partner
    When the buyer opt for 'Add From Existing'
    Then the Address is add for the Partner on RMS and RMS DB

  @SUP-33
  Scenario: Manage Partners - Secondary Address - Delete
    Given a buyer access a existing Address page for a partner
    When the buyer delete the partner address that is set up as non-primary
    Then the Address is delete for the partner on RMS and RMS DB

  @SUP-34
  Scenario: Manage Partners - Primary Address - Delete
    Given a buyer access a existing Primary Address for a partner
    When the buyer attempt to delete the partner address that is setup as a Primary Address
    Then the buyer is unable to delete the partner address

  @SUP-26
  Scenario: Manage Partners - Expense
    Given a buyer access Manage Partners page
    When a buyer access Partners edits page
    Then the buyer is able to create expense details by entering Shipping Routes, Expenses and Rate Updates

  #@SUP-27 @canceled
  #Scenario:Manage Partners - Required Documents
  #  Given  a buyer access Manage Partners page
  #  When a buyer access Partners edits page
  #  Then the buyer is able to create documents for the selected Partner

  #@SUP-28 @canceled
  #Scenario: Manage Partners - Delete Documents
  #  Given  a buyer access Manage Partners page
  #  When a buyer access Partners edits page
  #  Then the buyer is able to remove documents for the selected Partner