Feature: Store Format

  @STF-01
  Scenario: Store Format - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template |
      | Foundation | Store Formats |
    Then the buyer is able to view the excel template file from the local directory

  @STF-02
  Scenario Outline: Store Format - Upload
    Given a user is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type | template |
      | Foundation | Store Formats |
    Then user upload the source <file>
    Examples:
      | file |
      | DIFF-17 Upload Diff Template File.ods |
