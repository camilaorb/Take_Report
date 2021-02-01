Feature: PO Create

  @BWS-POCREATE-01
  Scenario: Order Information tab - Delivery drop table - Add Delivery Drop record
    Given  a user accesses the Order Information tab
    When the user Add a delivery drop
    Then  a new delivery drop record in the delivery drop table

  @BWS-POCREATE-02
  Scenario: Order Information tab - Delivery drop table - Delete Delivery Drop record
    Given  a user accesses the Order Information tab
    When the user Delete a a new delivery drop
    Then  the record is removed from the Delivery Drop table

  @BWS-POCREATE-03
  Scenario: Order Information tab - Delivery drop table - Split Delivery button
    Given  a user amends the Order information
    And select a specified delivery
    When the user selects the 'Split Delivery' button
    Then  a new Delivery Drop record is created with the exact same attributes has the selected delivery drop
    And the Delivery Drop is set to 0 (Zero)
    # - User must adjust quantities between Delivery Drops
    # - Verify that the Order Ref Id in the Order Information section of the screen i(reference to the split deliveries)
    # is correctly populated when the spilt Deliveries is confirmed
