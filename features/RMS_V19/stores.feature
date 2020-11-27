Feature: Organizational_Hierarchy

  @STR-01
  Scenario: Stores - Add Stores
    Given buyer is on the organisations hierarchy screen
    When buyer create store with mandatory details
    Then the new Store is add on top of Store table and created RMS DB

  @STR-02
  Scenario: Store - Amend Store
    Given buyer is on the organisations hierarchy screen
    When buyer update store with mandatory details
    Then the record is update to the Store table and RMS DB

  @STR-03
  Scenario: Stores - Add Location Traits
    Given buyer completes the setup of a store
    When buyer add location trait for the store with mandatory details
    Then the new Location is add on top of Store Location Traits table and created RMS DB

  @STR-04
  Scenario: Stores - Delete Location Traits
    Given buyer completes the setup of a store
    When buyer delete location trait for the store
    Then the record is removed from the Store Location Traits table and RMS DB

#  @STR-05  @Pending
#     #    This is not in scope but will be reviewed by the business in December
#     #   - possible inclusion once the process of replenishment is confirmed
#  Scenario: Stores - Add Delivery Schedule
#    Given buyer completes the setup of a store
#    When buyer add Delivery Schedule for the store with mandatory details
#    Then the new Schedule is add on top of Delivery Schedule table
#
#  @STR-06  @Pending
#     #    This is not in scope but will be reviewed by the business in December
#     #   - possible inclusion once the process of replenishment is confirmed
#  Scenario: Stores - Add Exception for Delivery Schedule
#    Given buyer create the Delivery Schedule of store
#    When buyer add Exception for the the Delivery Schedule with mandatory details
#    Then the new exception is add on top of Source Delivery Exception table
#
#    # This Scenario is Scenario Out of Scope
#  @STR-07 @Pending
#  Scenario: Stores - Add Walkthrough Store
#    Given buyer completes the setup of a parent store
#    When buyer add walkthrough store for the parent store
#    Then the new walkthrough store is add on top of walkthrough store table
#
#    # This Scenario is Scenario Out of Scope
#  @STR-08 @Pending
#  Scenario: Stores - Delete Walkthrough Store
#    Given buyer completes the setup of a parent store
#    When buyer delete walkthrough store for the parent store
#    Then the record is removed from walkthrough store table
