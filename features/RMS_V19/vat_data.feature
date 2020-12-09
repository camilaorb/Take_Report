Feature: VAT

  @VAT-01 @no_critical
  Scenario: VAT Code - Downloads
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type          | template |
      | Finance Administration | VAT      |
    Then the buyer is able to view the excel template file from the local directory

  @VAT-02
  Scenario Outline: VAT Code - Upload
    Given a buyer is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type          | template |
      | Finance Administration | VAT      |
    Then user upload the source <file>
    Examples:
      | file                         |
      | VAT-02 VAT Code - Upload.ods |

  @VAT-03
  Scenario: VAT Code - Create
    Given a buyer opts to create a new "VAT Code"
    When a buyer upload the source file with the information
      | template_type          | template | file                         |
      | Finance Administration | VAT      | VAT-03 VAT Code - Create.ods |
    Then the VAT Code is created in RMS and RMS DB upon successful upload of the file

  @VAT-04
  Scenario: VAT Code - Edit
    Given a buyer opts to edit a existing "VAT Code"
    When a buyer upload the source file with the information
      | template_type          | template | file                       |
      | Finance Administration | VAT      | VAT-04 VAT Code - Edit.ods |
    Then the VAT Code is updated in RMS and RMS DB upon successful upload of the file

  @VAT-05
  Scenario: VAT Code - Delete
    Given a buyer opts to remove a "VAT Code"
    When a buyer upload the source file with the information
      | template_type          | template | file                         |
      | Finance Administration | VAT      | VAT-05 VAT Code - Delete.ods |
    Then the VAT Code is deleted in RMS and RMS DB upon successful upload of the file

  @VAT-06
  Scenario: VAT Code - Upload Success
    Given a buyer has uploaded "VAT Code" file successfully
      | template_type          | template | file                                 |
      | Finance Administration | VAT      | VAT-06 VAT Code - Upload Success.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process

  @VAT-07
  Scenario: VAT Code - Upload Failure
    Given a buyer has failed to upload a "VAT Code" file
      | template_type          | template | file                                 |
      | Finance Administration | VAT      | VAT-07 VAT Code - Upload Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @VAT-08
  Scenario: VAT Code - Re-Upload
    Given a buyer has a "VAT Code" file that has failed to upload
      | template_type          | template | file1                        |
      | Finance Administration | VAT      | VAT-08 VAT Code - Upload.ods |
    When the buyer downloads the file and makes the necessary correction
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload
      | template_type          | template | file2                          |
      | Finance Administration | VAT      | VAT-08 VAT Code - ReUpload.ods |

  @VAT-09
  Scenario: VAT Rates - Create
    Given a buyer opts to create a new "VAT Rate"
    When a buyer upload the source file with the information
      | template_type          | template | file                          |
      | Finance Administration | VAT      | VAT-09 VAT Rates - Create.ods |
    Then the VAT Rates is created in RMS and RMS DB upon successful upload of the file

  @VAT-10
  Scenario: VAT Rates - Edit
    Given a buyer opts to edit a existing "VAT Rate"
    When a buyer upload the source file with the information
      | template_type          | template | file                        |
      | Finance Administration | VAT      | VAT-10 VAT Rates - Edit.ods |
    Then the VAT Rate is updated in RMS and RMS DB upon successful upload of the file

  @VAT-11
  Scenario: VAT Rates - Delete
    Given a buyer opts to remove a "VAT Rate"
    When a buyer upload the source file with the information
      | template_type          | template | file                          |
      | Finance Administration | VAT      | VAT-11 VAT Rates - Delete.ods |
    Then the VAT Rate is deleted in RMS and RMS DB upon successful upload of the file

  @VAT-12
  Scenario: VAT Rates - Upload Success
    Given a buyer has uploaded "VAT Rate" file successfully
      | template_type          | template | file                                  |
      | Finance Administration | VAT      | VAT-12 VAT Rates - Upload Success.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process

  @VAT-13
  Scenario: VAT Rates - Upload Failure
    Given a buyer has failed to upload a "VAT Rate" file
      | template_type          | template | file                                  |
      | Finance Administration | VAT      | VAT-13 VAT Rates - Upload Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @VAT-14
  Scenario: VAT Rates - Re-Upload
    Given a buyer has a "VAT Rate" file that has failed to upload
      | template_type          | template | file1                         | file2                            |
      | Finance Administration | VAT      | VAT-14 VAT Rates - Upload.ods | VAT-14 VAT Rates - Re-Upload.ods |
    When the buyer downloads the file and makes the necessary correction
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload

  @VAT-15
  Scenario: VAT Regions - Create
    Given a buyer opts to create a new "VAT Region"
    When a buyer upload the source file with the information
      | template_type          | template | file                            |
      | Finance Administration | VAT      | VAT-09 VAT Regions - Create.ods |
    Then the VAT Regions is created in RMS and RMS DB upon successful upload of the file

  @VAT-16
  Scenario: VAT Regions - Edit
    Given a buyer opts to edit a existing "VAT Region"
    When a buyer upload the source file with the information
      | template_type          | template | file                          |
      | Finance Administration | VAT      | VAT-10 VAT Regions - Edit.ods |
    Then the VAT Region is updated in RMS and RMS DB upon successful upload of the file

  @VAT-17
  Scenario: VAT Regions - Delete
    Given a buyer opts to remove a "VAT Region"
    When a buyer upload the source file with the information
      | template_type          | template | file                            |
      | Finance Administration | VAT      | VAT-17 VAT Regions - Delete.ods |
    Then the VAT Region is deleted in RMS and RMS DB upon successful upload of the file

  @VAT-18
  Scenario: VAT Regions - Upload Success
    Given a buyer has uploaded "VAT Region" file successfully
      | template_type          | template | file                                    |
      | Finance Administration | VAT      | VAT-18 VAT Regions - Upload Success.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process

  @VAT-19
  Scenario: VAT Regions - Upload Failure
    Given a buyer has failed to upload a "VAT Region" file
      | template_type          | template | file                                    |
      | Finance Administration | VAT      | VAT-19 VAT Regions - Upload Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @VAT-20
  Scenario: VAT Regions - Re-Upload
    Given a buyer has a "VAT Region" file that has failed to upload
      | template_type          | template | file1                           | file2                              |
      | Finance Administration | VAT      | VAT-20 VAT Regions - Upload.ods | VAT-20 VAT Regions - Re-Upload.ods |
    When the buyer downloads the file and makes the necessary correction
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload
