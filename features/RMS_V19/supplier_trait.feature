Feature: Supplier Trait

  @SPT-01
  Scenario: Supplier Trait - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template |
      | Foundation | Supplier Traits |
    Then the buyer is able to view the excel template file from the local directory