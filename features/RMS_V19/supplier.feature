Feature: Supplier

  @SUP-01
  Scenario: Searching for a Supplier
    Given a buyer is in Manage Supplier screen
    When buyer enters Supplier information the search criteria
    Then the results for the Supplier search criteria is displayed in the Results table

  @SUP-02
  Scenario: Supplier - Address
    Given a buyer is in Manage Supplier screen
    When a buyer access Suppliers edits page
    Then the buyer is able to amend the details of the Supplier Address

  @SUP-03
  Scenario: Add Supplier Address
    Given a buyer access the Address page for a supplier
    When the buyer is able to add address details
    Then the new Address is add for the Supplier on RMS and RMS DB

  @SUP-04
  Scenario: Edit Supplier Address
    Given a buyer access the Address page for a supplier
    When the buyer is able to edit address details
    Then the Address is update for the Supplier on RMS and RMS DB

  @SUP-05
  Scenario: Add From Existing Address Details
    Given a buyer access the Address page for a supplier
    When the buyer is able to opt 'Add From Existing'
    Then the Address is add for the Supplier on RMS and RMS DB



