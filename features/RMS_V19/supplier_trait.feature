Feature: Supplier Trait

  @SPT-01
  Scenario: Supplier Trait - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template        |
      | Foundation    | Supplier Traits |
    Then the buyer is able to view the excel template file from the local directory

  @SPT-02
  Scenario Outline: Supplier Trait - Upload
    Given a buyer is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type | template        |
      | Foundation    | Supplier Traits |
    Then user upload the source <file>
    Examples:
      | file                               |
      | SPT-02 Supplier Trait - Upload.ods |

  @SPT-03
  Scenario: Supplier Trait - Create
    Given a buyer opts to create a new "Supplier Trait"
    When a buyer upload the source file with the information
      | template_type | template        | file                               |
      | Foundation    | Supplier Traits | SPT-03 Supplier Trait - Create.ods |
    Then the Supplier Trait is created in RMS and RMS DB upon successful upload of the file

  @SPT-04
  Scenario: Supplier Trait - Edit
    Given a buyer opts to edit a existing "Supplier Trait"
    When a buyer upload the source file with the information
      | template_type | template        | file                             |
      | Foundation    | Supplier Traits | SPT-04 Supplier Trait - Edit.ods |
    Then the Supplier Trait is updated in RMS and RMS DB upon successful upload of the file

  @SPT-05
  Scenario: Supplier Trait - Delete
    Given a buyer opts to remove a "Supplier Trait"
    When a buyer upload the source file with the information
      | template_type | template        | file                               |
      | Foundation    | Supplier Traits | SPT-05 Supplier Trait - Delete.ods |
    Then the Supplier Trait is deleted in RMS and RMS DB upon successful upload of the file

  @SPT-06
  Scenario: Supplier Trait - Upload Success
    Given a buyer has uploaded "Supplier Trait" file successfully
      | template_type | template        | file                                       |
      | Foundation    | Supplier Traits | SPT-06 Supplier Trait - Upload Success.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process

  @SPT-07
  Scenario: Supplier Trait - Upload Failure
    Given a buyer has failed to upload a "Supplier Trait" file
      | template_type | template        | file                                       |
      | Foundation    | Supplier Traits | SPT-07 Supplier Trait - Upload Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @SPT-08
  Scenario: Supplier Trait - Re-Upload
    Given a buyer has a "Supplier Trait" file that has failed to upload
      | template_type | template        | file1                              |
      | Foundation    | Supplier Traits | SPT-08 Supplier Trait - Upload.ods |
    When the buyer downloads the file and makes the necessary correction
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload
      | template_type | template        | file2                                 |
      | Foundation    | Supplier Traits | SPT-08 Supplier Trait - Re-Upload.ods |
