Feature: Transfer Zone

  @TFZ-01
  Scenario: Transfer Zone - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template |
      | Foundation | Transfer Zones |
    Then the buyer is able to view the excel template file from the local directory