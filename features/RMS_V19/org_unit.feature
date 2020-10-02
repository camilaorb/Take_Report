Feature: Org Unit

  @ORGU-01
  Scenario: Org Units - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template |
      | Administration | Org Units |
    Then the buyer is able to view the excel template file from the local directory