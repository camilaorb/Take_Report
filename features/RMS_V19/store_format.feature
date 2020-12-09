Feature: Store Format

  @STF-01 @no_critical
  Scenario: Store Format - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template      |
      | Foundation    | Store Formats |
    Then the buyer is able to view the excel template file from the local directory

  @STF-02
  Scenario Outline: Store Format - Upload
    Given a buyer is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type | template      |
      | Foundation    | Store Formats |
    Then user upload the source <file>
    Examples:
      | file                             |
      | STF-02 Store Format - Upload.ods |


  @STF-03
  Scenario: Store Format - Create
    Given a buyer opts to create a new "Store Format"
    When a buyer upload the source file with the information
      | template_type | template      | file                             |
      | Foundation    | Store Formats | STF-03 Store Format - Create.ods |
    Then the Store Format is created in RMS and RMS DB upon successful upload of the file

  @STF-04
  Scenario: Store Format - Edit
    Given a buyer opts to edit a existing "Store Format"
    When a buyer upload the source file with the information
      | template_type | template      | file                           |
      | Foundation    | Store Formats | STF-04 Store Format - Edit.ods |
    Then the Store Format is updated in RMS and RMS DB upon successful upload of the file

  @STF-05
  Scenario: Store Format - Delete
    Given a buyer opts to remove a "Store Format"
    When a buyer upload the source file with the information
      | template_type | template      | file                             |
      | Foundation    | Store Formats | STF-05 Store Format - Delete.ods |
    Then the Store Format is deleted in RMS and RMS DB upon successful upload of the file

  @STF-06
  Scenario: Store Format - Upload Success
    Given a buyer has uploaded "Store Format" file successfully
      | template_type | template      | file                                     |
      | Foundation    | Store Formats | STF-06 Store Format - Upload Success.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process

  @STF-07
  Scenario: Store Format - Upload Failure
    Given a buyer has failed to upload a "Store Format" file
      | template_type | template      | file                                     |
      | Foundation    | Store Formats | STF-07 Store Format - Upload Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @STF-08
  Scenario: Store Format - Re-Upload
    Given a buyer has a "Store Format" file that has failed to upload
      | template_type | template      | file1                            |
      | Foundation    | Store Formats | STF-08 Store Format - Upload.ods |
    When the buyer downloads the file and makes the necessary correction
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload
      | template_type | template      | file2                              |
      | Foundation    | Store Formats | STF-08 Store Format - ReUpload.ods |
