Feature: Organizational Hierarchy

  @ORGH-01
  Scenario: Division - Add Division
    Given buyer is on the organizations hierarchy screen
    When buyer create division where division and name are mandatory
    Then the new Division is add on top of Division table and created RMS DB

  @ORGH-02
  Scenario: Division - Edit Division
    Given buyer is on the organizations hierarchy screen
    When buyer update where division name are mandatory
    Then the record is update to the Division table and RMS DB

  @ORGH-03
  Scenario: Division - Delete Division
    Given buyer is on the organizations hierarchy screen
    When a buyer delete a Division
    Then the record is removed from the Division table and RMS DB

  @ORGH-04
  Scenario: Country - Add Country
    Given buyer is on the organizations hierarchy screen
    When buyer create country where country id and country name are mandatory
    Then the new Country is add on top of Country table and created RMS DB

  @ORGH-05
  Scenario: Country - Edit Country
    Given buyer is on the organizations hierarchy screen
    When buyer update country where country name are mandatory
    Then the record is update to the Country table and RMS DB

  @ORGH-06
  Scenario: Country - Delete Country
    Given buyer is on the organizations hierarchy screen
    When a buyer delete a Country
    Then the record is removed country record from the Country table and RMS DB

  @ORGH-07
  Scenario: Region - Add Region
    Given buyer is on the organizations hierarchy screen
    When buyer create region where region and name are mandatory
    Then the new Region is add on top of Region table and created RMS

  @ORGH-08
  Scenario: Region - Edit Region
    Given buyer is on the organizations hierarchy screen
    When buyer update region where region name are mandatory
    Then the record is update to the Region table and RMS DB

  @ORGH-09
  Scenario: Region - Delete Region
    Given buyer is on the organizations hierarchy screen
    When a buyer delete a Region
    Then the record is removed from the Region table and RMS DB

  @ORGH-10
  Scenario: Area - Add Area
    Given buyer is on the organizations hierarchy screen
    When buyer create area where area and name are mandatory
    Then the new Area is add on top of Area table and created RMS

  @ORGH-11
  Scenario: Area - Edit Area
    Given buyer is on the organizations hierarchy screen
    When buyer update where Area name are mandatory
    Then the record is update to the Area table and RMS DB

  @ORGH-12
  Scenario: Area - Delete Area
    Given buyer is on the organizations hierarchy screen
    When a buyer delete a Area
    Then the record is removed from the Area table and RMS DB

