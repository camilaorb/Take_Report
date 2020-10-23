Feature: Banner and Channel

  @BC-01
  Scenario Outline: Add Banner to RMS
    Given a buyer is in Foundation Upload screen
    When buyer selects the Template Type and Template which auto populates the Process Description with timestamp
      | template_type | template |
      | Foundation | Banners and Channels |
    Then user upload the source <file>
    Examples:
      | file |
      | BC-01 Add Banner to RMS.ods |

  @BC-02
  Scenario: Download Foundation - Banners and Channels
    Given a buyer is in Foundation Download screen
    When buyer selects Template Type, Template and opts for Download
      | template_type | template |
      | Foundation | Banners and Channels |
    Then the buyer is able to view the excel template file from the local directory

  @BC-03
  Scenario: Create Banner
    Given a buyer opts to create a new "Banner"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Foundation | Banners and Channels | BC-03 Create Banner.ods |
    Then the Banner is created in RMS and RMS DB upon successful upload of the file

  @BC-04
  Scenario: Create Channel
    Given a buyer opts to create a new "Channel"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Foundation | Banners and Channels | BC-04 Create Channel.ods |
    Then the Channel is created in RMS and RMS DB upon successful upload of the file

  @BC-05
  Scenario: Exist Banner - Edit
    Given a buyer opts to edit a existing "Banner"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Foundation | Banners and Channels | BC-05 Exist Banner - Amend.ods |
    Then the Banner is updated in RMS and RMS DB upon successful upload of the file

  @BC-06
  Scenario: Exist Channel - Edit
    Given a buyer opts to edit a existing "Channel"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Foundation | Banners and Channels | BC-06 Exist Channel - Amend.ods |
    Then the Channel is updated in RMS and RMS DB upon successful upload of the file

  @BC-07
  Scenario: Banner - Delete
    Given a buyer opts to remove a "Banner"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Foundation | Banners and Channels | BC-07 Banner - Delete.ods |
    Then the Banner is deleted in RMS and RMS DB upon successful upload of the file

  @BC-08
  Scenario: Channel - Delete
    Given a buyer opts to remove a "Channel"
    When a buyer upload the source file with the information
      | template_type | template | file |
      | Foundation | Banners and Channels | BC-08 Channel - Delete.ods |
    Then the Channel is deleted in RMS and RMS DB upon successful upload of the file

  @BC-09
  Scenario: Banner/Channel - Upload
    Given a buyer has uploaded "Banner/Channel" file successfully
      | template_type | template | file |
      | Foundation | Banners and Channels | BC-09 Banner/Channel - Upload.ods |
    When the Buyer accesses Review Status
    Then the Buyer is able to determine the success of the upload by checking the status of the process

  @BC-10
  Scenario: Banner/Channel - Error Handling
    Given a buyer has failed to upload a "Banner/Channel" file
      | template_type | template | file |
      | Foundation | Banners and Channels | BC-10 Banner/Channel - Error Handling.ods |
    When the Buyer accesses Review Status
    Then the buyer is able to view the reason for error

  @BC-11
  Scenario: Banner/Channel - Re-Upload
    Given a buyer has a "Banner/Channel" file that has failed to upload
      | template_type | template | file1 | file2 |
      | Foundation | Banners and Channels | BC-11 Banner/Channel - Upload.ods | BC-11 Banner/Channel - Re-Upload.ods |
    When the buyer is able to view the reason for error
    Then the buyer is able to re-upload the template file and re-assess the latest status of the upload