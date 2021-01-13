Feature: BWS Create Item


  #Item Tab

  @BWS-CREATEITEM-01
  Scenario: Add New Item - Item Tab
    Given the Assistant Buyer on 'Item & Ordering Worklist' page
    When the assistant Buyer manually adds an Add New Item to the Buyers Worklist
    Then the assistant Buyer is able add specific details
    #Item ID is pre-populated and non-editable

  @BWS-CREATEITEM-02
  Scenario: Item Tab - Sub-Department
    Given an Assistant Buyer on item create tab
    When an assistant buyer enters the Sub-Department
    Then  the values listed for the Category are specific for the selected sub-department
    #Merch Hierarchy defaults are set up in RMS that determines the values for the sub-category when a category is selected

  @BWS-CREATEITEM-03
  Scenario: Item Tab - Category
    Given an Assistant Buyer on item create tab
    When an assistant buyer enters a the Category
    Then  the values listed for the sub-category are specific to the selected sub-department and category
    #Merch Hierarchy defaults are set up in RMS that determines the values for the sub-category when a category is selected

  @BWS-CREATEITEM-04
  Scenario: Item Tab - Item Main Description
    Given an Assistant Buyer on item create tab
    When the assistant buyer enters the Main Description for the Item
    Then the field is limited to '250' Characters
    #When user attempts to enter >250 characters, the marketing description will not allow
    #Defaulted from Main Description
    #Mandatory field
    #Alphanumeric
    #Maps to ITEM_DESC of ITEM_MASTER table in RMS schema

  @BWS-CREATEITEM-05
  Scenario: Item Tab - Marketing Description
    Given an Assistant Buyer on item create tab
    When the assistant buyer enters the Marketing Description for the Item
    Then the field is limited to '250' Characters
    #When user attempts to enter >250 characters, the marketing description will not allow
    #Defaulted from Main Description
    #Mandatory field
    #Alphanumeric
    #Maps to ITEM_DESC of ITEM_MASTER table in RMS schema

  @BWS-CREATEITEM-06
  Scenario: Add New Item - Item Tab - Detailed Description
    Given an Assistant Buyer on item create tab
    When the assistant buyer enters the Detailed Description for the Item
    Then the field is limited to '250' Characters
    #holds Item Detailed Description
    # -Mandatory
    # -Alphanumeric
    # -Maps to ITEM_DESC_SECONDARY of ITEM_MASTER table in RMS schema

  @BWS-CREATEITEM-07
  Scenario: Add New Item - Item Tab - Supplier Label
    Given an Assistant Buyer on item create tab
    When an assistant buyer enters description for the Supplier Label
    Then the field is limited to '15' Characters
    #Optional field
    #Alphanumeric
    #Maps to SUPP_LABEL of ITEM_SUPPLIER table in RMS schema

  @BWS-CREATEITEM-08
  Scenario: Item Tab - Differentiator - Colour
    Given an Assistant Buyer on item create tab
    When the assistant buyer enters the Colour ID
    Then the colour Diff is created
    #The Diff is always set to "ID" for the COLOUR Diff, not group
    #User can only pick 1 colour for the Style
    #Diff Type is always defaulted to SIZE
    #If 1 Colour and 1 Size is selected then the Diffs is referred to as "Solids Item"
    #If 1 Colour and Mutiple Sizes are selected then the Item is referred as "Fashion Item"

  @BWS-CREATEITEM-09
  Scenario: Item Tab - Differentiator - Size
    Given an Assistant Buyer on item create tab
    When the assistant buyer enters the Size ID
    Then the Size Diffs are created
    #The Diff is always set to "ID" for the SIZE Diff, not group
    #Diff Type is always defaulted to GROUP
    #Once a Size and Colour are selected the Item created is at aggregate level
    #If 1 Colour and 1 Size is selected then the Diffs is referred to as "Solids Item"
    #If 1 Colour and Multiple Sizes are selected then the Item is referred as "Fashion Item"

  @BWS-CREATEITEM-10
  Scenario: Item Tab - Supplier Colour
    Given an Assistant Buyer on item create tab
    When the  assistant buyer enters the colour differentiator on Supplier Diff 1 field
    Then the assistant buyer is able to enter the supplier colour
    And the field is limited to '120' Characters
    And Only available if colour is defined using Differentiator Colour otherwise it is disabled
    #If the Colour Differentiator is not defined then this field is disabled
    #Maps to SUPP_DIFF_1 of ITEM_SUPPLIER table in RMS schema
    #Optional
    #Alphanumeric

  @BWS-CREATEITEM-11
  Scenario: Item Tab - Special Instructions
    Given an Assistant Buyer on item create tab
    When an assistant buyer enters the special instructions
    Then the assistant buyer will not be able to exceed 2000 characters in the placeholder
    #  - Maps to Comments attribute of ITEM_MASTER table in RMS schema
    #  - Optional, Alphanumeric
    #  - The special instructions defined will be defaulted at the delivery drop level

  @BWS-CREATEITEM-12
  Scenario: Item Tab - Swing Tag
    Given an Assistant Buyer on item create tab
    When the  assistant buyer selects the Swing Tag button
    Then the user is able to add new swing tab
    #  - Maximum of 3 Swing Tags per Item, all default to Purchase Order level
    #  - Optional, Alphanumeric
    #  - The maximum number of Swing Tags must be defined in a Merch Workbench System Option
    #  - Will be a CFA at Purchase Order Level (ORDHEAD and ORDSKU)

  @BWS-CREATEITEM-13
  Scenario: Item Tab - Swing Tag - Add Button
    Given an assistant buyer enters the details for the Swing Tag
    When the  assistant buyer attempts to create  greater than 3 swing tags by the Add button
    Then a message must appear prompting user to remove the additional swing tags

  @BWS-CREATEITEM-14
  Scenario: Item Tab - Swing Tag - System Options
    Given an admin updates System Options 'Swing Tag' column to say 5
    When the user accesses the swing tag placeholder in Item tab
    Then the number of tags allowed in the placeholder, selected when Add Swing Tag button is initiated does not exceed the value set at the System Options
    #- Need to confirm the name of the Swing Tag field at System options

  @BWS-CREATEITEM-15
  Scenario: Item Tab - Supplier Site
    Given an Assistant Buyer on item create tab
    When an assistant buyer enters the Supplier Site for the Style
    Then the field must display the supplier site ID and name
    #  - Verify - Field is mandatory
    #  - Predictive suggestion available
    #  - Supplier Sites are available in SUPS RMS table

  @BWS-CREATEITEM-16
  Scenario: Item Tab - Country of Sourcing
    Given an Assistant Buyer on item create tab
    When an assistant buyer enters the Country of Sourcing
    Then the field must display the ID-Country and Description
    #  - List of Countries available on COUNTRY table
    #  - Mandatory
    #  - Defaults from a combination of Item / Supplier Site
    #  - Predictive suggestion available

  @BWS-CREATEITEM-17
  Scenario: Item Tab - Country of Manufacture
    Given an Assistant Buyer on item create tab
    When an assistant buyer enters the Country of Manufacture
    Then the field must display the ID-Country Description
    #  - List of Countries available on COUNTRY table
    #  - Mandatory
    #  - Defaults from a combination of Item / Supplier Site
    #  - Predictive suggestion available

  @BWS-CREATEITEM-18
  Scenario: Item Tab - Port of Lading
    Given an Assistant Buyer on item create tab
    When an assistant buyer opts to enter the Port of Lading of the Item/Supplier/Country of Sourcing
    Then the assistant buyer is able view the ID and Port Description in the field
    #  - Options must be filtered by Country of Sourcing
    #  - List of Countries available on OUTLOC table from RMS
    #  - defaulted to all Delivery Drops in the Order information tab
    #  - Predictive suggestion available
    #  - Optional








  @BWS-CREATEITEM-17
  Scenario: Add New Item - Cost Zone Group ID
    Given an Assistant Buyer on item create tab
    When the assistant buyer enters the Cost Zone Group ID
    Then the Cost Zone Groups are displayed from the LOV that are defined in RMS (defined as part of foundation)

  @BWS-CREATEITEM-18
  Scenario: Add New Item - Base Cost - Supplier Currency
    Given an Assistant Buyer on item create tab
    When the user enters the Base Cost
    Then the Base Cost value will default to Supplier Currency
    #  - All calculations around Base Cost will be done using the default supplier currency
    #  - Mandatory
    #  - Numeric

  @BWS-CREATEITEM-19
  Scenario: Add New Item - Base Cost - System Currency
    Given an assistant buyer accesses the Base Cost displayed in Supplier Currency
    When the user enters the Base Cost
    Then the field alongside the Base Cost will display the Base Cost converted to the System Currency which is ZAR
    And the converted System Currency field is not editable
    #  - The Value displayed in System Currency is ZAR - This is not amendable
    #  - The Value of the System Currency is non-editable and updates if the Base Cost at Supplier Currency is amended
    #  - Base Cost is always defaulted to Supplier’s currency
    #  - Consolidated Exchange Rate to be used when converting from Supplier Currency to System Currency
    #  - The converted Base Cost to be calculated online and not stored
    #  - Mandatory, Numeric

  @BWS-CREATEITEM-20
  Scenario: Add New Item - Expenses
    Given an Assistant Buyer on item create tab
    When the user enters the Cost to Expenses to access "Enter Expenses"
    And adds the Expense Type (Zone level or Country level) and the Component for each Expense Type for the Style
    Then the Expense Type and Component details calculates the expenses which is published in the Expenses field
    #  - The 'Enter Expenses' becomes selectable once the Cost of the Item is entered
    #  - The expense Type comprises of Type(Zone Level/Country), Zone, Lading Port & Discharge Port
    #  - The Component panel comprises of Comp ID, CVB code, Component Rate, Currency & Estimated Expense Value
    #  - The expenses are displayed to 2 d.p

  @BWS-CREATEITEM-21
  Scenario: Add New Item - HTS
    Given an Assistant Buyer on item create tab
    When an Assistant Buyer opts to add HTS Cod
    Then the user is only able to add a code from a list of HTS codes (defined in RTM)
    #  - HTS (Duty) codes are based on Country of Manufacture

  @BWS-CREATEITEM-22
  Scenario: Add New Item - Unit ELC
    Given an Assistant Buyer on item create tab
    When an Assistant Buyer opts to add HTS Cod
    Then the user is only able to add a code from a list of HTS codes (defined in RTM)
    #  - HTS (Duty) codes are based on Country of Manufacture

