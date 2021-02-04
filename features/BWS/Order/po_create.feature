Feature: PO Create

  @BWS-POCREATE-01 @bws_tests
  Scenario: Order Information tab - Delivery drop table - Add Delivery Drop record
    Given a user accesses the Order Information tab
    When the user Add a delivery drop
    Then a new delivery drop record in the delivery drop table

  @BWS-POCREATE-02 @bws_tests @issue
  Scenario: Order Information tab - Delivery drop table - Delete Delivery Drop record
    Given a user accesses the Order Information tab
    When the user Delete a a new delivery drop
    Then the record is removed from the Delivery Drop table

  @BWS-POCREATE-03 @bws_tests
  Scenario: Order Information tab - Delivery drop table - Split Delivery button
    Given a user accesses the Order Information tab
    And select a specified delivery
    When the user opts to 'Split Delivery'
    Then a new Delivery Drop record is created with the exact same attributes has the selected delivery drop
    And the Delivery Drop is set to 0 'Zero'

  @BWS-POCREATE-04 #need all tabs finished
  Scenario: Order Information Screen
    Given an assistant buyer completes the setup of the Item
    When the assistant buyer accesses the Order Information tab
    Then the partioned screen displays 3 sections 'Delivery Drop section', 'SKU Distribution section' and 'Packs Create section'

  @BWS-POCREATE-05 #need to check if it's working
  Scenario: Delivery Drop panel - Swing tags
    Given an assistant buyer accesses the Delivery Drop panel
    When the user selects the checkbox against the Swing Tag Req
    Then the the Swing Tags associated to the Item will be defaulted to the Purchase Order

  @BWS-POCREATE-06 #Green Light
  Scenario: Delivery Drop panel - Signal Light - Green
    Given a user has fully distributed the quantities derived in Order Information tab
    When the Total Quantities are successfully Distributed
    Then the indicator contained in the Order Information details displays 'Green'
    # - Send BWS Group to RMS
    # - Verify the Distribution of the quantities

  @BWS-POCREATE-07 #Red Light
  Scenario: Delivery Drop panel - Signal Light - Red
    Given a user has distributed the quantities derived in Order Information tab
    When the Total Quantities are either partially or none Distributed
    Then the indicator contained in the Order Information details displays 'Red'
    # - Send BWS Group to RMS
    # - Verify the Distribution of the quantities

  @BWS-POCREATE-08 @bws_tests
  Scenario: Delivery Drop panel - Order No
    Given an assistant buyer accesses the Delivery Drop table
    When the assistant buyer views the delivery drop details
    Then the Order No which holds the Purchase Order ID is displayed and is non-editable

  @BWS-POCREATE-09 @bws_tests
  Scenario: Delivery Drop panel - Order Ref ID (1/2)
    Given an assistant buyer accesses the Delivery Drop table
    When a new Delivery Drop is added
    Then the Order Ref ID increases sequentially

  @BWS-POCREATE-10 @bws_tests @issue
  Scenario: Delivery Drop panel - Order Ref ID (2/2)
    Given an assistant buyer accesses the Delivery Drop table
    When a new Delivery Drop is deleted
    Then the Order Ref ID is not adjusted

  @BWS-POCREATE-11
  Scenario: Delivery Drop panel - Swing Tag Req.
    Given an assistant buyer accesses the Delivery Drop table
    When a new delivery drop is created
    Then the Swing Tags associated to the Item will be defaulted to the Purchase Order
    # - Swing Tag defined in Item tab
    # - Swing Tags associated to the Purchase Order using CFAs at Purchase Order level

  @BWS-POCREATE-12
  Scenario: Delivery Drop panel - Delivery Drop Quantity
    Given an assistant buyer accesses the Delivery Drop table
    When the assistant buyer enters the Delivery Drop Quantity
    Then a message must be displayed if the user attempts to enter a negative value in the field
    And message is displayed if a non-numeric or combination of numeric and non-numeric values are entered
    # - Mandatory
    # - Numeric

  @BWS-POCREATE-13
  Scenario: Delivery Drop panel - Location Type
    Given an assistant buyer accesses the Delivery Drop table
    When the assistant buyer enters the Location type
    Then the type must default to 'Warehouse' displaying ID and Description of the location
    # - Verify that the only values that must appear in the drop=down are 'Warehouse' or 'Store'
    # - Mandatory

  @BWS-POCREATE-14
  Scenario: Delivery Drop panel - Location - WH
    Given an assistant accesses the Delivery Drop section of the Order Information tab
    When the assistant buyer has selected Warehouse for the Location Type
    Then the Location drop-down must only display the Warehouse ID-Name
    And the default value must be set to 'Hammersdale'
    # - Hammarsdale warehouse must be always defaulted when ranging during Item create

  @BWS-POCREATE-15
  Scenario: Delivery Drop panel - Location - Store
    Given an assistant accesses the Delivery Drop section of the Order Information tab
    When the assistant buyer has selected 'Store' for the Location Type
    Then the Location drop-down must only display the Store ID-Name

  @BWS-POCREATE-16
  Scenario: Delivery Drop panel - OTB Week
    Given an assistant buyer accesses the Delivery Drop table
    When the assistant buyer enters a numeric value for the OTB Week
    Then the OTB Week must not exceed 52 week
    # - Mandatory
    # - Numeric






