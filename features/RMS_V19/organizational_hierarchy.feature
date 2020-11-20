Feature: Organizational_Hierarchy

  @ORGH-01
  Scenario: Division - Add Division
    Given buyer is on the organisations hierarchy screen
    When buyer create division where division and name are mandatory
    Then the new Division is add on top of Division table and created RMS DB

  @ORGH-02
  Scenario: Division - Edit Division
    Given buyer is on the organisations hierarchy screen
    When buyer update where division name are mandatory
    Then the record is update to the Division table and RMS DB

  @ORGH-03
  Scenario: Division - Delete Division
    Given buyer is on the organisations hierarchy screen
    When a buyer delete a the Division
    Then the record is removed from the Division table and RMS DB

  @ORGH-04
  Scenario: Country - Add Country
    Given buyer is on the organisations hierarchy screen
    When buyer create country where country id and country name are mandatory
    Then the new Country is add on top of Country table and created RMS DB

  @ORGH-05
  Scenario: Country - Edit Country
    Given buyer is on the organisations hierarchy screen
    When buyer update country  where country name are mandatory
    Then the record is update to the Country table and RMS DB

  @ORGH-06
  Scenario: Country - Delete Country
    Given buyer is on the organisations hierarchy screen
    When a buyer delete a the Country
    Then the record is removed country record from the Country table and RMS DB

  @ORGH-07
  Scenario: Region - Add Region
    Given buyer is on the organisations hierarchy screen
    When buyer create region where region and name are mandatory
    Then the new Region is add on top of Region table and created RMS

  @ORGH-08
  Scenario: Region - Edit Region
    Given buyer is on the organisations hierarchy screen
    When buyer update region where region name are mandatory
    Then the record is update to the Region table and RMS DB

  @ORGH-09
  Scenario: Region - Delete Region
    Given buyer is on the organisations hierarchy screen
    When a buyer delete a the Region
    Then the record is removed from the Region table and RMS DB

  @ORGH-10
  Scenario: Area - Add Area
    Given buyer is on the organisations hierarchy screen
    When buyer create area where area and name are mandatory
    Then the new Area is add on top of Area table and created RMS

  @ORGH-11
  Scenario: Area - Edit Area
    Given buyer is on the organisations hierarchy screen
    When buyer update where Area name are mandatory
    Then the record is update to the Area table and RMS DB

#  @ORGH-12
#  Scenario: Area - Delete Area
#    Given a buyer selects from the Tasks menu Foundation Data > Location Foundation > Organizational Hierarchy
#    And selects the District button
#    When buyer clicks on the District link against the District that is marked for deletionAND opts for Action > Delete
#    Then the buyer is able to remove the District
#      | area |
#      | 41   |
#
#
#  @ORGH-13
#  Scenario: Create Area - Add District
#    Given a buyer selects from the Tasks menu Foundation Data > Location Foundation > Organizational Hierarchy
#    And selects the District button or selects the District Create icon on the Region page
#    When buyer selects Action > Create followed by selects Action > Add
#    Then the buyer is able to enter details for the District
#
#  @ORGH-14
#  Scenario: Create District - Edit District
#    Given a buyer selects from the Tasks menu Foundation Data > Location Foundation > Organizational Hierarchy
#    And selects the District button
#    When buyer clicks on the District linkAND opts Action > Edit
#    Then the buyer is able to amend and update details for the District
#
#  @ORGH-15
#  Scenario: Create District - Delete District
#    Given a buyer selects from the Tasks menu Foundation Data > Location Foundation > Organizational Hierarchy
#    And selects the District button
#    When buyer clicks on the District link against the District that is marked for deletionAND opts for Action > Delete
#    Then the buyer is able to remove the District


  @STR-01
  Scenario: Create New Store
    Given a buyer selects from the Tasks menu Foundation Data > Location Foundation > Organizational Hierarchy
    And selects the Stores button
    When buyer selects Action > Create or use the create icon
    Then the buyer is able to enter the necessary details for the Store
