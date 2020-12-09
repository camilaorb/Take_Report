Feature: Transfer Zone

  @TFZ-01 @no_critical
  Scenario: Transfer Zone - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template       |
      | Foundation    | Transfer Zones |
    Then the buyer is able to view the excel template file from the local directory

  @TFZ-02
  Scenario Outline: Transfer Zone - Upload
    Given a buyer is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type | template       |
      | Foundation    | Transfer Zones |
    Then user upload the source <file>
    Examples:
      | file                              |
      | TFZ-02 Transfer Zone - Upload.ods |

  @TFZ-03
  Scenario: Transfer Zone - Create
    Given a buyer opts to create a new "Transfer Zone"
    When a buyer upload the source file with the information
      | template_type | template       | file                              |
      | Foundation    | Transfer Zones | TFZ-03 Transfer Zone - Create.ods |
    Then the Transfer Zone is created in RMS and RMS DB upon successful upload of the file

  @TFZ-04
  Scenario: Transfer Zone - Edit
    Given a buyer opts to edit a existing "Transfer Zone"
    When a buyer upload the source file with the information
      | template_type | template       | file                            |
      | Foundation    | Transfer Zones | TFZ-04 Transfer Zone - Edit.ods |
    Then the Transfer Zone is updated in RMS and RMS DB upon successful upload of the file

  @TFZ-05
  Scenario: Transfer Zone - Delete
    Given a buyer opts to remove a "Transfer Zone"
    When a buyer upload the source file with the information
      | template_type | template       | file                              |
      | Foundation    | Transfer Zones | TFZ-05 Transfer Zone - Delete.ods |
    Then the Transfer Zone is deleted in RMS and RMS DB upon successful upload of the file

  @TFZ-06
  Scenario: Transfer Zone - Upload Success
    Given a buyer has uploaded "Transfer Zone" file successfully
      | template_type | template       | file                                      |
      | Foundation    | Transfer Zones | TFZ-06 Transfer Zone - Upload Success.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process

  @TFZ-07
  Scenario: Transfer Zone - Upload Failure
    Given a buyer has failed to upload a "Transfer Zone" file
      | template_type | template       | file                                      |
      | Foundation    | Transfer Zones | TFZ-07 Transfer Zone - Upload Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @TFZ-08
  Scenario: Transfer Zone - Re-Upload
    Given a buyer has a "Transfer Zone" file that has failed to upload
      | template_type | template       | file1                             |
      | Foundation    | Transfer Zones | TFZ-08 Transfer Zone - Upload.ods |
    When the buyer downloads the file and makes the necessary correction
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload
      | template_type | template       | file2                                |
      | Foundation    | Transfer Zones | TFZ-08 Transfer Zone - Re-Upload.ods |
