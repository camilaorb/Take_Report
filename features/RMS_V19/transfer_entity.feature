Feature: Transfer Entity

  @TFE-01
  Scenario: Transfer Entity - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template |
      | Finance Administration | Transfer Entities |
    Then the buyer is able to view the excel template file from the local directory

  @TFE-02
  Scenario: Transfer Entity - Create
    Given a buyer opts to create a new "Transfer Entity"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Finance Administration | Transfer Entities | TFE-02 Transfer Entity - Create.ods |
    Then the Transfer Entity is created in RMS and RMS DB upon successful upload of the file

  @TFE-03
  Scenario: Transfer Entity - Edit
    Given a buyer opts to edit a existing "Transfer Entity"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Finance Administration | Transfer Entities | TFE-03 Transfer Entity - Edit.ods |
    Then the Transfer Entity is updated in RMS and RMS DB upon successful upload of the file

  @TFE-04
  Scenario: Transfer Entity - Delete
    Given a buyer opts to remove a "Transfer Entity"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Finance Administration | Transfer Entities | TFE-04 Transfer Entity - Delete.ods |
    Then the Transfer Entity is deleted in RMS and RMS DB upon successful upload of the file

  @TFE-05
  Scenario: Transfer Entity - Upload Success
    Given a buyer has uploaded "Transfer Entity" file successfully
      | template_type | template | file |
      | Finance Administration | Transfer Entities | TFE-05 Transfer Entity - Upload Success.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process

  @TFE-06
  Scenario: Transfer Entity - Upload Failure
    Given a buyer has failed to upload a "Transfer Entity" file
      | template_type | template | file |
      | Finance Administration | Transfer Entities | TFE-06 Transfer Entity - Upload Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @TFE-07
  Scenario: Transfer Entity - Re-Upload
    Given a buyer has a "Transfer Entity" file that has failed to upload
      | template_type | template | file1 | file2 |
      | Finance Administration | Transfer Entities | TFE-07 Transfer Entity - Upload.ods | TFE-07 Transfer Entity - Re-Upload.ods |
    When the buyer is able to view the reason for error
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload