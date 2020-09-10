Feature: Merch 01

  Scenario: Merch 01 - Add Division

  Given user selects Foundation Data > Item Foundation > Merchandise Hierarchy from the task menu AND clicks on the Division button and opts for ‘Actions > Create’
  When the user selects the ‘Actions > Add’ (or using the Add icon) from the menu and completes the mandatory detail by entering Division ID, Name, Total Market Amounts, Buyer Name and Merchandiser name and saves the entry
  Then the Division will be created in RMS
  And Division will be created RMS DB