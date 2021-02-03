Feature: BWS Create Item

#Item Tab
  @BWS-CREATEITEM-01 @bws_tests
  Scenario: Add New Item - Item Tab
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When the assistant Buyer manually adds an Add New Item to the Buyers Worklist
    Then the assistant Buyer is able add specific details
    #Item ID is pre-populated and non-editable

  @BWS-CREATEITEM-02 @bws_tests
  Scenario: Item Tab - Sub-Department
    Given an Assistant Buyer on Item tab
    When an assistant buyer enters the Sub-Department
    Then  the values listed for the Category are specific for the selected sub-department
    #Merch Hierarchy defaults are set up in RMS that determines the values for the sub-category when a category is selected


  @BWS-CREATEITEM-03 @bws_tests
  Scenario: Item Tab - Category
    Given an Assistant Buyer on Item tab
    When an assistant buyer enters a the Category
    Then  the values listed for the sub-category are specific to the selected sub-department and category
    #Merch Hierarchy defaults are set up in RMS that determines the values for the sub-category when a category is selected


  @BWS-CREATEITEM-04 @bws_tests
  Scenario: Item Tab - Supplier Style No
    Given an Assistant Buyer on Item tab
    When an assistant buyer enters the Supplier Style No
    Then the field is limited to '30' Characters
    #Optional field
    #Alphanumeric
    #Maps to SUPP_LABEL of ITEM_SUPPLIER table in RMS schema
   # Table  = select SUPP_LABEL from ITEM_SUPPLIER - But Needs to verify to look its exist after item created successfully

  @BWS-CREATEITEM-05 @bws_tests
  Scenario: Item Tab - Item Description
    Given an Assistant Buyer on Item tab
    When the assistant buyer enters the Description for the Item
    Then the field is limited to '30' Characters
    #When user attempts to enter >250 characters, the marketing description will not allow
    #Defaulted from Main Description
    #Mandatory field
    #Alphanumeric
    #Maps to ITEM_DESC of ITEM_MASTER table in RMS schema

  @BWS-CREATEITEM-06 @bws_tests
  Scenario: Item Tab - Marketing Description
    Given an Assistant Buyer on Item tab
    When the assistant buyer enters the Marketing Description for the Item
    Then the field is limited to '120' Characters
    #When user attempts to enter >250 characters, the marketing description will not allow
    #Defaulted from Main Description
    #Mandatory field
    #Alphanumeric
    #Maps to ITEM_DESC of ITEM_MASTER table in RMS schema

  @BWS-CREATEITEM-07 @bws_tests
  Scenario: Detailed Description
    Given an Assistant Buyer on Item tab
    When the assistant buyer enters the Detailed Description for the Item
    Then the field is limited to '250' Characters
    #Business Acceptance :  Schema Verification Remains Until The ITEM Create SuccessFully
    # -Maps to ITEM_DESC_SECONDARY of ITEM_MASTER table in RMS schema


  @BWS-CREATEITEM-08 @bws_tests
  Scenario: Item Tab - Differentiator - Colour
    Given an Assistant Buyer on Item tab
    When the assistant buyer enters the Colour ID
    Then the colour Diff is created


  @BWS-CREATEITEM-09 @bws_tests
  Scenario: Item Tab - Differentiator - Size
    Given an Assistant Buyer on Item tab
    When the assistant buyer enters the Size ID
    Then the Size Diffs are created


  @BWS-CREATEITEM-10 @bws_tests #@wip #[CB]
  Scenario: Item Tab - Supplier Colour
    Given an Assistant Buyer on Item tab
    When the assistant buyer enters the colour differentiator on Supplier Diff 1 field
    Then the assistant buyer is able to enter the supplier colour
    And Only available if colour is defined using Differentiator Colour otherwise it is disabled
    And the field is limited to '120' Characters
        #If the Colour Differentiator is not defined then this field is disabled
        #Maps to SUPP_DIFF_1 of ITEM_SUPPLIER table in RMS schema
        #Optional
        #Alphanumeric

  @BWS-CREATEITEM-11 @bws_tests #@wip #[CB]
  Scenario: Item Tab - Special Instructions
    Given an Assistant Buyer on Item tab
    When an assistant buyer enters the special instructions
    Then the field is limited to '2000' Characters
    #  - Maps to Comments attribute of ITEM_MASTER table in RMS schema
    #  - Optional, Alphanumeric
    #  - The special instructions defined will be defaulted at the delivery drop level

  @BWS-CREATEITEM-12 @bws_tests
  Scenario: Item Tab - Swing Tag
    Given an Assistant Buyer on Item tab
    When the assistant buyer selects the Swing Tag button
    Then the user is able to add new swing tab

  @BWS-CREATEITEM-13 @bws_tests
  Scenario: Item Tab - Swing Tag - Add Button
    Given an assistant buyer enters the details for the Swing Tag
    When the assistant buyer attempts to create more than 3 swing tags by the Add button
    Then the Add button will not be displayed


  @BWS-CREATEITEM-14 @bws_tests
  Scenario: Item Tab - Swing Tag - System Options
    Given an admin updates System Options 'Swing Tag' column to "2"
    When the user accesses the swing tag placeholder in Item tab
    Then the number of tags allowed in the placeholder does not exceed the value set at the System Options


  @BWS-CREATEITEM-15 @bws_tests
  Scenario: Item Tab - Supplier Site
    Given an Assistant Buyer on Item tab
    When an assistant buyer enters the Supplier Site for the Style
    Then the field must display the supplier site ID and name


  @BWS-CREATEITEM-16 @bws_tests
  Scenario: Item Tab - Country of Sourcing
    Given an Assistant Buyer on Item tab
    When an assistant buyer enters the Country of Sourcing
    Then the field must display the ID-Country and Description
    #  - List of Countries available on COUNTRY table
    #  - Mandatory
    #  - Defaults from a combination of Item / Supplier Site
    #  - Predictive suggestion available

  @BWS-CREATEITEM-17 @bws_tests
  Scenario: Item Tab - Country of Manufacture
    Given an Assistant Buyer on Item tab
    When an assistant buyer enters the Country of Manufacture
    Then the field must display the ID-Country Description


  @BWS-CREATEITEM-18 @bws_tests
  Scenario: Item Tab - Port of Lading
    Given an Assistant Buyer on Item tab
    When an assistant buyer opts to enter the Port of Lading
    Then the assistant buyer is able view the ID and Port Description in the field


  @BWS-CREATEITEM-19 @bws_tests
  Scenario: Item Tab - Cost Zone Group ID
    Given an Assistant Buyer on Item tab
    When the assistant buyer enters the Cost Zone Group ID
    Then the Cost Zone Groups are displayed

  @BWS-CREATEITEM-20 @bws_tests
  Scenario: Item Tab - Base Cost - Supplier Currency
    Given an Assistant Buyer on Item tab
    When the user enters the Base Cost
    Then the Base Cost value will default to Supplier Currency


  @BWS-CREATEITEM-21 @bws_tests
  Scenario: Item Tab - Base Cost - System Currency
    Given an assistant buyer accesses the Base Cost displayed in Supplier Currency
    When the user enters the Base Cost
    Then the field alongside the Base Cost will display the Base Cost converted to the System Currency which is ZAR
    And the converted System Currency field is not editable

  @BWS-CREATEITEM-22 @bws_tests
  Scenario: Item Tab - Expenses(1/2)
    Given an Assistant Buyer on Item tab
    When the user enters the Cost to Expenses to access "Enter Expenses"
    And adds the Expense Type and the Component for each Expense Type for the Style
    Then the Expense Type and Component details calculates the expenses which is published in the Expenses field


  @BWS-CREATEITEM-23 @WIP @bws_tests
  Scenario: Item Tab - HTS
    Given an Assistant Buyer on Item tab
    When an Assistant Buyer opts to add HTS Cod
    Then the user is only able to add a code from a list of HTS codes

    #->working
  @BWS-CREATEITEM-24 @WIP @bws_tests
  Scenario: Item Tab - Unit ELC
    Given an Assistant Buyer on Item tab
    When an Assistant Buyer opts to add HTS Cod
    Then the Unit ELC is calculated and the value is displayed and is non-editable
    #  - Unit ELC can be amended by changing the HTS Code



  #->working
  @BWS-CREATEITEM-25 @WIP @bws_tests
  Scenario: Item Tab - Initial Selling Price
    Given an Assistant Buyer on Item tab
    When the assistant buyer enters the Initial Selling Price -ISP- with currency defaulted to ZAR
    Then this will be used to automatically assign the Selling Retail for the South Africa Price Zone in the Price by Zone Tab and calculated the foreign prices

#    Business Acceptance
#- Selling Price is always in ZAR
#- Price Point Matrix as source for South Africa
#- The field is an LOV (identified by the magnifying glass) and displays the Prices that a user can select
#- When user sets up the Initial Selling Price in the Item tab then the user can click on Price by Zone tab and the value will be displayed
#- Numeric and Mandatory
#- The value defined in this field will be used as the  Selling Price for the South Africa Price Zone in the Price By Zone Tab
#- In Price by Zone tab - Foreign Zones will be automatically fulfilled using the Initial Selling Price value and the Price Points structure


  @BWS-CREATEITEM-26 @bws_tests
  Scenario: Item Tab - PMO
    Given the assistant buyer accesses the PMO field
    When the assistant buyer enter the Cost and Initial Retail Value
    Then the PMO is calculated, correct value is displayed and is non-editable


  @BWS-CREATEITEM-27 @bws_tests
  Scenario: Item Tab -  Ti/Hi - Inner/Case Pack Quantity
    Given an Assistant Buyer on Item tab
    When the assistant buyer enters the Ti/Hi
    Then the user is able to amend the value


  #UDA Tab
  @BWS-CREATEITEM-28 @bws_tests
  Scenario: Add New Item - UDA tab
    Given an assistant buyer create a new Item
    When the assistant buyer navigates to the 'UDA' sub-tab contained within  the ""Buy Details"" section of the screen and selects 'Add'
    Then a blank UDA screen opens and the assistant buyer is able to enter the following UDA details, UDA, UDA Value, Mandatory, Apply To

  @BWS-CREATEITEM-29 @bws_tests
  Scenario: UDA tab - Delete UDA
    Given an Assistant Buyer on UDA tab
    When an assistant buyer selects one or more UDAs
    Then an assistant buyer is able to remove the UDA

  #SKU Tab
  @BWS-CREATEITEM-30 @WIP
  Scenario: SKU tab - Add SKU(1/2)
    Given an assistant buyer accesses the SKU tab
    When the user opts to add a SKU to the Item (style)
    And selects 'By Group' option
    Then a pop-up window opens prompting user to select the Diff Range labelled as 'Range'
    #  - The values for the Range are defined in the Buy Details > Item tab

  @BWS-CREATEITEM-31 @WIP
  Scenario: SKU tab - Add SKU(2/2)
    Given the user opts to add a SKU to the Item (style)
    When the user has selected a  Diff Range labelled 'Range' and Apply on the pop-up
    And an assistant buyer selects size and colour from pop-up
    Then a record for the selected size and colour are created
    # - If for example 2 Sizes and 2 Colour are selected then 4 lines are created in the SKU tab
    #  - Diff Range are set-up in RMS
    #  - The list of size and colour contained within a Range are setup in RMS
  @BWS-CREATEITEM-40 @bws_tests
  Scenario: Item & Ordering Worklist - Packing Method
    Given a user opts to add packing method
    When the user clicks on the Packing Method field
    Then the possible options are "Flat" and "Hanger"

  @BWS-CREATEITEM-62 @bws_tests
  Scenario: Item & Ordering Worklist - Inner Pack Size
    Given an assistant buyer lands on the Inner Pack Size field
    When the assistant buyer enters a number
    Then the number must be 8 digits in length with 4 decimal places

  @BWS-CREATEITEM-63 @bws_tests
  Scenario: Item & Ordering Worklist - Case Pack Qty
    Given an assistant buyer lands on the Case Pack Qty field
    When the assistant buyer enters a number
    Then the Case Pack Qty number must be 8 digits in length with 4 decimal places

  @BWS-CREATEITEM-64 @bws_tests
  Scenario: Item Tab - Expenses(2/2)
    Given an Assistant Buyer on Item tab
    When the user enters the Cost to Expenses to access "Enter Expenses"
    And adds the Expense Type and the Component for each Expense Type for the Style
    Then the Expense Type and Component details calculates the expenses which is published in the Expenses field with Estimated Expense Value'>0

