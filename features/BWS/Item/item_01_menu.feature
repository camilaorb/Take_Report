Feature: BWS Item Menu

  ## table after create ITEM =  OAO_BWS_ITEM
  # This scenario verification of 1. Merge Delivery Drops 2. Reject Item Remains because the Functionality not
  # developed yet
  @BWS-MENU-01
  Scenario: review a list of Items
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When 'Item & Ordering Worklist' task open
    Then the assistant buyer has the option to review a list of Items or either create new, copy or open an exiting item or merge, delete or reject an item


  @BWS-MENU-02
  Scenario: Add new ITEM
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When  the 'Item sub-tab' displays within the Item Information section
    Then the assistant Buyer is able add specific details including Item’s merchandise hierarchy, Supplier Site, Country of Sources and Country of Manufacturing, Base Cost and Differentiators


  @BWS-MENU-03
  Scenario: Add ITEM - Add Existing Item
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the assistant buyer selects the Add Existing Item
    Then the buyer will be presented with a pop-up to search from approved Items from RMS


  @BWS-MENU-04
  Scenario: Add ITEM - Copy From Existing Item(1/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the assistant buyer selects the Copy From Existing Item
    Then  the user will be presented with a pop-up to search from approved Items from RMS to Copy From


  @BWS-MENU-05
  Scenario: Add Item - Copy From Existing Item(2/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the assistant buyer selects the Copy From Existing Item
    Then Item ID will be copied form the existing item and Item ID will be automatically generated using ORIN Type


  @BWS-MENU-06
  Scenario: Delete ITEM (1/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the buyer selects the Item & Ordering Line using the checkbox and Delete Item (red cross logo) from the menu
    Then the Item & Ordering Line from the worklist will be deleted

    #-> Creating PO has an issue at the moment and defect has raised for "ADF - error"
   # To verify "the Item is on a repeating Purchase Order" - First PO needs to create
  @BWS-MENU-07
  Scenario: Delete ITEM (2/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the buyer selects the Item & Ordering Line using the checkbox and Delete Item (red cross logo) from the menu
    And the Item is on a repeating Purchase Order
    Then  the Item & Ordering Line from the worklist will be  deleted but the Item will "not" be deleted from RMS

    #-> Functionality under developed
  @BWS-MENU-08
  Scenario: Reject ITEM (1/2)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the buyer review the Item & Ordering Line and selects one or more Item & Ordering line from the worklist
    And selects the Reject button
    Then the Item & Ordering Line will be set to Reject Status and assigned to the assistant buyer with a comment

    #-> Functionality under developed
  @BWS-MENU-09
  Scenario: Reject ITEM (2/2)
    Given a buyer or planner rejects an Item & Ordering Line
    When the assistant buyer has submitted the Item & Ordering Line
    Then a confirmation message pop-up prompting the buyer/planner to Assign to the the assistant buyer coupled with a comments that explains the reasons for rejection

  @BWS-MENU-10
  Scenario: Merge Selected (1/2)
    Given a buyer opts to merge delivery drops in an Item & Ordering Worklist
    When  the buyer selects multiple Item & Ordering lines from the worklist and select Merge Dlv. Drops > Merge Selected
    Then the resultant Purchase Order contain multiple SKUs from different items

  @BWS-MENU-11
  Scenario: Merge Selected (2/2)
    Given a buyer opts to merge delivery drops in an Item & Ordering Worklist
    When a buyer has an Item & Ordering Worklist that has drops on different weeks
    Then merge will happen on the weeks that all items have delivery drops defined and single POs will be created for differ weeks
    And Warning must be shown to user highlighting which weeks were not merged

  @BWS-MENU-12
  Scenario: Un-Merge Selected
    Given a user opts to Un-Merge delivery drops in an Item & Ordering Worklist
    When the item & Ordering have been successfully merged and select Merge Dlv. Drops > Un-Merge Selected
    Then then the single Item & Ordering Line containing multi SKUs from different Items will result back into multi Item & Ordering Lines each containg SKUs and Items

    #Pending once inside project download will finished
  @BWS-MENU-15
  Scenario: Export to Excel
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When the user selects the 'Export To Excel' option
    Then the details of the Buyers Worksheet are presented in excel format

   #-> working
    #Pending Work
    #Defect Raised - Waiting for the update from paula
    # System not allows to create order information
    #-> updated US 12/01/2021
  @BWS-MENU-16
  Scenario: Item & Ordering Worklist - Submit(1/4)
    Given a buyer selects the 'Item & Ordering Worklist' option from task menu
    When buyer select checkbox against the Item and Ordering line and click the 'Submit'
    Then the BWS 'Status' column will be updated to  'Submitted'

  @BWS-MENU-17
  Scenario: Item & Ordering Worklist - Submit(2/4)
    Given a user performs a new merge or un-merge action
    When the user submits the Item & Ordering line
    Then a  warning must be shown to the user stating with Weeks could not be merged if rules of merge are no met

  @BWS-MENU-18
  Scenario: Item & Ordering Worklist - Submit(3/4)
    Given a user performs a new merge or un-merge action
    When the user submits the Item & Ordering line
    Then the Item & Worklist will be created as a single order if  rules of merge are no met the PO is sent to RMS

  @BWS-MENU-19
  Scenario: Item & Ordering Worklist - Submit(4/4)
    Given an assistant buyer submits an Item & Ordering Line
    When the confirmation message is displayed
    Then the assistant buyer is able to assign the Item & Ordering Line to a Buyer

  @BWS-MENU-20
  Scenario: Item & Ordering Worklist - Approve(1/4)
    Given a Buyer accesses the Item & Ordering Worklist
    When the Buyer checks the appropriate Item & Ordering line and selects the 'Approve' button
    Then the 'Status' column will be updated to 'Approved'

    ## NA - US ##
  @BWS-MENU-21
  @BWS-MENU-22
  @BWS-MENU-23

  @BWS-MENU-24
  Scenario: Item & Ordering Worklist -Send(1/8)
    Given a planner accesses the Item & Ordering Worklist
    When the Planner checks the appropriate checkbox for Approved Item & Ordering line(s)
    Then the user is able to Send the Item & Ordering Line(s) and Item & Ordering Line status is updated to 'Send'

  @BWS-MENU-25
  Scenario: Item & Ordering Worklist -Send(2/8)
    Given a planner sends the Item & Ordering Line
    When the planner attempts to edit the Item & Ordering Line
    Then the Item and Ordering line is locked and cannot be edited using the Item & Ordering screen

  @BWS-MENU-26
  Scenario: Item & Ordering Worklist -Send(3/8)
    Given a planner accesses the Item & Ordering Worklist
    When the Fullfilment UDA is set to 'YES' and Order Information is not available
    Then the planner selects the Send button for an approved Item & Ordering Line and the Item & Ordering Line are sent to RMS

  @BWS-MENU-25
  Scenario: Item & Ordering Worklist -Send(4/8)
    Given the Fullfilment UDA is set to 'YES' and Order Information is available
    When the planner selects the Send button for an approved Item & Ordering Line
    And the user confirms that the Order Information has been verified and deemed as correct and selects 'OK'
    Then the Item & Ordering Line are sent to RMS

  @BWS-MENU-26
  Scenario: Item & Ordering Worklist -Send(5/8)
    Given the Fullfilment UDA is set to 'NO' and Order Information is not available
    When the planner selects the Send button for an approved Item & Ordering Line
    Then the item & Ordering Line does not integrate to RMS and a message is displayed

  @BWS-MENU-27
  Scenario: Item & Ordering Worklist -Approved (6/8)
    Given a user performs a new merge or un-merge action
    When the user submits the Item & Ordering line
    And If rules of merge are no met
    Then a  warning must be shown to the user stating with Weeks could not be merged

  @BWS-MENU-29
  @BWS-MENU-30
  @BWS-MENU-31

  @BWS-MENU-32
  Scenario: Item & Ordering Worklist - Item & Ordering Line creation in RMS
    Given a planner has approved an Order
    When the planner logs into RMS to verify the Item and PO Ordering Line
    Then RMS Item tables must display the correct number of Styles

  @BWS-MENU-33
  Scenario: Item and PO integration from BWS to RMS
    Given a planner has approved an Order
    When the planner logs into RMS to verify the Item and PO Ordering Line
    Then RMS PO tables must display the correct number of Purchase Orders