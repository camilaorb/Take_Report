Feature: Banner and Channel

  @BC-01
  Scenario Outline: Add Banner to RMS
    Given a user is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type | template |
      | Foundation | Banners and Channels |
    Then user upload the source <file>
    Examples:
      | file |
      | DIFF-17 Upload Diff Template File.ods |

  @BC-02
  Scenario: Download Foundation - Banners and Channels
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template |
      | Items | Differentiators |
    Then the buyer is able to view the excel template file from the local directory