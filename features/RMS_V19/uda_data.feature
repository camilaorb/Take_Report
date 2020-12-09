Feature: UDA

  @UDA-01 @no_critical
  Scenario: UDA_VALUES - UDA_DEFAULTS - Download
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template                |
      | Items         | User Defined Attributes |
    Then the buyer is able to view the excel template file from the local directory

  @UDA-02
  Scenario Outline: UDA_VALUES - UDA_DEFAULTS - Upload
    Given a buyer is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type | template                |
      | Items         | User Defined Attributes |
    Then user upload the source <file>
    Examples:
      | file                                          |
      | UDA-02 UDA_VALUES - UDA_DEFAULTS - Upload.ods |

  @UDA-03
  Scenario: UDA - LOV - Create
    Given a buyer opts to create a new "LOV type UDA"
    When a buyer upload the source file with the information
      | template_type | template                | file                          |
      | Items         | User Defined Attributes | UDA-03 UDA - LOV - Create.ods |
    Then the UDA is created in RMS and RMS DB upon successful upload of the file

  @UDA-04
  Scenario: UDA - LOV - Edit
    Given a buyer opts to edit a existing "LOV type UDA"
    When a buyer upload the source file with the information
      | template_type | template                | file                        |
      | Items         | User Defined Attributes | UDA-04 UDA - LOV - Edit.ods |
    Then the UDA is updated in RMS and RMS DB upon successful upload of the file

  @UDA-17
  Scenario: UDA - LOV - Delete
    Given a buyer opts to remove a "LOV type UDA"
    When a buyer upload the source file with the information
      | template_type | template                | file                          |
      | Items         | User Defined Attributes | UDA-04 UDA - LOV - Delete.ods |
    Then there are Items attached to the LOV UDA so the user will not be able to remove the UDA


  @UDA-05
  Scenario: UDA - FF - Create
    Given a buyer opts to create a new "FF type UDA"
    When a buyer upload the source file with the information
      | template_type | template                | file                         |
      | Items         | User Defined Attributes | UDA-05 UDA - FF - Create.ods |
    Then the UDA is created in RMS and RMS DB upon successful upload of the file

  @UDA-06
  Scenario: UDA - FF - Edit
    Given a buyer opts to edit a existing "LOV type UDA"
    When a buyer upload the source file with the information
      | template_type | template                | file                       |
      | Items         | User Defined Attributes | UDA-06 UDA - FF - Edit.ods |
    Then the UDA is updated in RMS and RMS DB upon successful upload of the file

  @UDA-07
  Scenario: UDA - LOV - FF - Date - Delete
    Given a buyer opts to remove a "UDA ID"
    When a buyer upload the source file with the information
      | template_type | template                | file                                      |
      | Items         | User Defined Attributes | UDA-07 UDA - LOV - FF - Date - Delete.ods |
    Then the record marked as deleted is removed from the RMS table UDA upon successful upload of the file


  @UDA-08
  Scenario: UDA Values - Create
    Given a buyer opts to create a new "UDA Value based on a UDA ID"
    When a buyer upload the source file with the information
      | template_type | template                | file                           |
      | Items         | User Defined Attributes | UDA-08 UDA Values - Create.ods |
    Then the UDA Value is created in RMS and RMS DB upon successful upload of the file

  @UDA-09
  Scenario: UDA Values -  Edit
    Given a buyer opts to edit a existing "UDA Value based on a UDA ID"
    When a buyer upload the source file with the information
      | template_type | template                | file                     |
      | Items         | User Defined Attributes | UDA-09 UDA Values - Edit.ods |
    Then the UDA Value is updated in RMS and RMS DB upon successful upload of the file

  @UDA-10
  Scenario: UDA Values -  Delete
    Given a buyer opts to remove a "UDA and associated Value and Description"
    When a buyer upload the source file with the information
      | template_type | template                | file                       |
      | Items         | User Defined Attributes | UDA-10 UDA Values - Delete.ods |
    Then the user is able to verify the deleted record in RMS

## Remains ##
  @UDA-11
  Scenario: UDA Defaults - Create
    Given a buyer opts to create a new "UDA Default for a specific UDA ID"
    When a buyer upload the source file with the information
      | template_type | template                | file                             |
      | Items         | User Defined Attributes | UDA-11 UDA Defaults - Create.ods |
    Then the user is able to view the new created UDA Defaults based on the New UDA Value for the specific Merchandise Hierarchy and on RMS DB

  @UDA-12
  Scenario: UDA Defaults - Edit
    Given a buyer opts to edit a existing "UDA Default for a specific UDA ID"
    When a buyer upload the source file with the information
      | template_type | template                | file                           |
      | Items         | User Defined Attributes | UDA-12 UDA Defaults - Edit.ods |
    Then the user is able to view the new created UDA Defaults based on the New UDA Value for the specific Merchandise Hierarchy and on RMS DB

  @UDA-13
  Scenario: UDA Defaults - Delete
    Given a buyer opts to remove a "UDA Default for a specific UDA ID"
    When a buyer upload the source file with the information
      | template_type | template                | file                             |
      | Items         | User Defined Attributes | UDA-13 UDA Defaults - Delete.ods |
    Then the user is able to view the deleted record in RMS DB

  @UDA-14
  Scenario: UDA_VALUES - UDA_DEFAULTS - Upload Success
    Given a buyer has uploaded "UDA template" file successfully
      | template_type | template                | file                                                  |
      | Items         | User Defined Attributes | UDA-14 UDA_VALUES - UDA_DEFAULTS - Upload Success.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process

  @UDA-15
  Scenario: UDA_VALUES - UDA_DEFAULTS - Failure
    Given a buyer has failed to upload a "UDA template" file
      | template_type | template                | file                                           |
      | Items         | User Defined Attributes | UDA-15 UDA_VALUES - UDA_DEFAULTS - Failure.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @UDA-16
  Scenario: UDA_VALUES - UDA_DEFAULTS - Re-Upload
    Given a buyer has a "UDA template" file that has failed to upload
      | template_type | template        | file1                                         | file2                                            |
      | Items         | Differentiators | UDA-16 UDA_VALUES - UDA_DEFAULTS - upload.ods | UDA-16 UDA_VALUES - UDA_DEFAULTS - Re-Upload.ods |
    When the buyer downloads the file and makes the necessary correction
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload

#  @UDA-17
#  Scenario: UDA - LOV - Delete
#    Given a buyer opts to remove a "UDA LOV"
#    When a buyer upload the source file with the information
#      | template_type | template | file |
#      | Items | Differentiators | UDA-17 UDA - LOV - Delete.ods |
#    Then the user will not be able to remove the UDA LOV

  @UDA-18
  Scenario: UDA - Date - Create
    Given a buyer opts to create a new "Date type UDA"
    When a buyer upload the source file with the information
      | template_type | template                | file                           |
      | Items         | User Defined Attributes | UDA-18 UDA - Date - Create.ods |
    Then the UDA Date is created in RMS and RMS DB upon successful upload of the file

  @UDA-19
  Scenario: UDA - Date - Edit
    Given a buyer opts to edit a existing "Date type UDA"
    When a buyer upload the source file with the information
      | template_type | template                | file                         |
      | Items         | User Defined Attributes | UDA-19 UDA - Date - Edit.ods |
    Then the UDA is updated in RMS and RMS DB upon successful upload of the file

  @UDA-20
  Scenario: UDA Values -  Delete with Items
    Given a buyer opts to remove a "UDA Values"
    When a buyer upload the source file with the information
      | template_type | template        | file                                      |
      | Items         | Differentiators | UDA-20 UDA Values - Delete with Items.ods |
    Then the user will not be able to remove the UDA Value

  @UDA-21
  Scenario: UDA - Date - Delete
    Given a buyer opts to remove a "Date type UDA"
    When a buyer upload the source file with the information
      | template_type | template        | file                           |
      | Items         | Differentiators | UDA-21 UDA - Date - Delete.ods |
    Then the UDA Date is deleted in RMS and RMS DB upon successful upload of the file
