Feature: VAT

  @VAT-01
  Scenario: VAT Code - Downloads
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template |
      | Finance Administration | VAT |
    Then the buyer is able to view the excel template file from the local directory