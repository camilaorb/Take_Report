Feature: Org Unit

  @ORGU-01
  Scenario: Org Units - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type  | template  |
      | Administration | Org Units |
    Then the buyer is able to view the excel template file from the local directory


  @ORGU-02
  Scenario Outline: Org Unit - Upload
    Given a buyer is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type  | template  |
      | Administration | Org Units |
    Then user upload the source <file>
    Examples:
      | file                          |
      | ORGU-02 Org Unit - Upload.ods |

  @ORGU-03
  Scenario: Org Unit - Create
    Given a buyer opts to create a new "Org Unit"
    When a buyer upload the source file with the information
      | template_type  | template  | file                          |
      | Administration | Org Units | ORGU-03 Org Unit - Create.ods |
    Then the Org Unit is created in RMS and RMS DB upon successful upload of the file

  @ORGU-04
  Scenario: Org Unit - Edit
    Given a buyer opts to edit a existing "Org Unit"
    When a buyer upload the source file with the information
      | template_type  | template  | file                        |
      | Administration | Org Units | ORGU-04 Org Unit - Edit.ods |
    Then the Org Unit is updated in RMS and RMS DB upon successful upload of the file


  @ORGU-05
  Scenario: Org Unit - Delete
    Given a buyer opts to remove a "Org Unit"
    When a buyer upload the source file with the information
      | template_type  | template  | file                          |
      | Administration | Org Units | ORGU-05 Org Unit - Delete.ods |
    Then the Org Unit is deleted in RMS and RMS DB upon successful upload of the file


  @ORGU-06
  Scenario: Org Unit - Upload Success
    Given a buyer has uploaded "Org Unit" file successfully
      | template_type  | template  | file                                  |
      | Administration | Org Units | ORGU-06 Org Unit - Upload Success.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process


  @ORGU-07
  Scenario: Org Unit - Upload Failure
    Given a buyer has failed to upload a "Org Unit" file
      | template_type  | template  | file                                  |
      | Administration | Org Units | ORGU-07 Org Unit - Upload Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error


  @ORGU-08
  Scenario: Org Unit - Re-Upload
    Given a buyer has a "Org Unit" file that has failed to upload
      | template_type  | template  | file1                         |
      | Administration | Org Units | ORGU-08 Org Unit - Upload.ods |
    When the buyer downloads the file and makes the necessary correction
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload
      | template_type  | template  | file2                           |
      | Administration | Org Units | ORGU-08 Org Unit - ReUpload.ods |
