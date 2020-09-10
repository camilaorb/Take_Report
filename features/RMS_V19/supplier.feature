#Feature: Supplier
#
#  @SUP-01
#  Scenario: Searching for a Supplier
#    Given a  buyer accesses Manage Supplier
#    When the supplier search page appears
#    Then the buyer is able to view the Supplier details
#
#  @SUP-02
#  Scenario: Supplier -  Address
#    Given a  buyer accesses Manage Supplier
#    When the buyer is able to amend the details of the Supplier address
#    Then the Supplier address will be updated in RMS DB
#
#
#
#  48. --Manage Supplier - Supplier -  Add Supplier Address
#
#  GIVEN a buyer access the Address page by selecting More Actions > Address
#  WHEN the buyer opts to add an Address for a selected supplier by selecting the Action>Add or the 'Add' icon
#  THEN the user is able to add address details
#  AND click OK to commit new create supplier address details
#
#  Business Acceptance
#  Verify the additional address using ADDR, SUPS tables
#
#  49. --Manage Supplier - Supplier - Edit Supplier Address
#
#  GIVEN a buyer access the Address page by selecting More Actions > Address
#  WHEN the buyer opts to edits an Address for a selected supplier by selecting the Action>Edit or the 'Pencil' icon
#  THEN the user is able to amend the address details
#  AND click OK to commit updated supplier address details
#
#  Business Acceptance
#  Verify the additional address using ADDR, SUPS tables
#
#  50. --Manage Supplier - Supplier - Add From Existing Address Details
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage Supplier
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Address
#  THEN the buyer is able to opt 'Add From Existing'
#  AND click OK to committ the address details
#
#  Business Acceptance
#  Buyer is able to use an existing address and use the details for the Supplier
#  Verify in ADDR, SUPS RMS table
#
#
#
#  -----Supplier Site
#
#  51. --Manage Supplier - Supplier Site - search
#
#  GIVEN a buyer edits a supplier site address for a specified Supplier
#  WHEN the buyer clicks on the supplier site ID link on the supplier search page
#  AND buyer selects More Actions > Address
#  THEN the buyer is able to amend the details of the Supplier address
#
#  Business Acceptance
#  Verify the change to Supplier in SUPS RMS DB
#
#
#  52. --Manage Supplier - supplier site - Add Address
#
#  GIVEN a buyer access the Address page by selecting More Actions > Address
#  WHEN the buyer opts to add an Address for a selected supplier site by selecting the Action>Add or the 'Add' icon
#  THEN the user is able to add address details
#  AND click OK to commit new create supplier address details
#
#  Business Acceptance
#  Verify the additional address using ADDR, SUPS tables
#
#  53. --Manage Supplier - supplier site -  Edit Address
#
#  GIVEN a buyer access the Address page by selecting More Actions > Address
#  WHEN the buyer opts to edits an Address for a selected supplier site by selecting the Action>Edit or the 'Pencil' icon
#  THEN the user is able to amend the address details
#  AND click OK to commit updated supplier site address details
#
#  Business Acceptance
#  Verify the supplier site address using ADDR, SUPS tables
#
#  54. --Manage Supplier - Supplier Site - Add From Existing Address Details
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage Partner
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Address
#  THEN the buyer is able to opt 'Add From Existing'
#  AND click OK to committ the address details
#
#  Business Acceptance
#  Buyer is able to use an existing address and use the details for the new create partner
#  Verify in SUPS, ADDR RMS table
#
#
#  55. --Manage Supplier - Supplier Siite - Inventory Management - Setup of Inventory
#
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage supplier
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Inventory Management
#  THEN buyer is able to create new inventory for the supplier site
#
#  Business Acceptance
#  If there is no inventory set-up for the Supplier Site, then a pop-up window is displayed whereby the user is prompt to enter 'Yes' to create a inventory or 'No' to opt out of creating inventory.
#  Buyer must enter details for Replenishment, Due Order Processing, Investment Buy, Scaling, Rounding, Supplier Minimums, Truck Splitting, Bracket Constraints and Other Attributes
#
#
#  56. --Manage Supplier - Org Unit
#
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage supplier
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Org Unit
#  THEN buyer is able to view Org Unit that is already setup by Finance
#  AND buyer is able to opt for the Org Unit and select OK to commit the Org Unit to the supplier site
#
#  Business Acceptance
#  Verify the supplier site address using ADDR, SUPS tables, ORG_UNIT
#
#
#  57. --Manage Supplier - Supplier Site - Add Supplier Traits
#
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage supplier
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Supplier Traits
#  THEN buyer is able to select a supplier trait from a list of value to the Supplier Site by either selecting Actions>Add or the 'Add' icon
#
#  Business Acceptance
#  Supplier Traits are setup independently in RMS and buyer is able to use the traits using the supplier traits option
#  Verify the supplier site address using ADDR, SUPS tables
#
#  58. --Manage Supplier - Supplier Site - Delete Supplier Traits
#
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage supplier
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Supplier Traits
#  THEN buyer is able to add a supplier trait from a list of value to the Supplier Site by either selecting Actions>Delete or the 'cross' icon
#
#  Business Acceptance
#  Supplier Traits are setup independently in RMS and buyer is able to use the traits using the supplier traits option
#  Verify removal of the traits in RMS
#
#
#  59. --Manage Supplier - Supplier Site - Add Documents
#
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage supplier
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Documents
#  THEN the buyer is able to create documents for the selected supplier site by opting Actions > Add or using the 'Add' icon to add the Document and description
#  AND click OK to committ documentation details for the selected supplier site
#
#  Business Acceptance
#  Add Document pop-up enables the buyer to select the Document by providing a list of values
#  Text field is free-format and allows buyer to add details of the document
#  Verify the supplier site address using SUPS tables
#
#
#  60. --Manage Supplier - Supplier Site - Delete Documents
#
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage supplier
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Documents
#  THEN the buyer is able to remove documents for the selected supplier site by opting Actions > Delete or using the 'cross' icon
#  AND click OK to commit the deletion of the document for the proposed supplier site
#
#  Business Acceptance
#  Verfiy the removal of the document for the supplier site in RMS
#
#
#  61. --Manage Supplier - Supplier Site - Import Attributes
#
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage supplier
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Import Attributes
#  THEN the buyer is able to create Import Attributes and Beneficiary Attributes by completing the details on the Impport Attributes page
#
#  Business Acceptance
#  Verify the Imnport details address using SUPS tables
#
#
#  62. --Manage Supplier - Supplier Site - Expense
#
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage Suuplier
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Expense
#  THEN the buyer is able to create expense details by entering Shipping Routes, Expenses and Rate Updates
#  AND click OK to committ expenses for the selected partner
#
#  Business Acceptance
#  Expense Components are defaulted from the selected Supplier
#  Supplier Site in the header is defaulted and non-editable
#  Profile Type must be selected at either Country or Zone level
#
#
#  63. --Manage Supplier - Supplier Site - Delivery Schedule
#
#  GIVEN  a buyer accesses from the task menu Foundation Data > Supplier and Partners > Manage Partner
#  WHEN the buyer enters or selects search criteria as desired to make the search more restrictive
#  AND clicks on search
#  AND Select More Actions > Delivery Schedule
#  THEN the buyer is able to create the schedule for the supplier site by entering Location, Location Name, Start Date, Frequancy, Day and Start/End Time
#  AND click OK to committ schedules for the selected site
#