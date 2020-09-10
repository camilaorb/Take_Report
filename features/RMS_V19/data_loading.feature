Feature: UDA

  @UDA-01
  Scenario: UDA_VALUES - UDA_DEFAULTS - Download
    Given a user is in Download screen
    When user selects Template Type, Template and opts for Download
    Then a excel file is downloaded containing multiple tabs, namely, Diff Types and Diff IDs

  @DIFF-16
  Scenario: Upload Diff Types Source File
    Given a user is in Upload screen
    When user selects the Template Type and Template which auto populates the Process Description with timestamp
    Then user upload the source file with changes on Diff Type tab for Action, Diff Type and Description


  @Diff-17
  Scenario: Upload Diff IDs Source File
    Given a user is in Upload screen
    When user selects the Template Type and Template which auto populates the Process Description with timestamp
    Then upload the source file with changes on Diff IDs tab for Action, Diff ID, Description and Diff Type

  @Diff-18
  Scenario Outline: Create New UDA - LOV
    Given a user creates a UDA based on List of Values LOV
    When the source <file> is successfully uploaded
    Then the UDA will appear as an LOV display type in RMS and RMS DB

    Examples:
      | file |
      | Diff-18 Create New UDA - LOV.ods |

  @Diff-19
  Scenario Outline: Assign UDA Values
    Given a user assigns a new value for an existing UDA
    When the source <file> is successfully uploaded
    Then the UDA Values in RMS and RMS DB

    Examples:
      | file |
      | Diff-19 Assign UDA Values.ods |

  @Diff-20
  Scenario Outline: Create New UDA - FF
    Given a user creates a UDA based on Free-Format FF
    When the source <file> is successfully uploaded
    Then the UDA will appear as 'FF' display type in RMS and RMS DB

    Examples:
      | file |
      | Diff-20 Create New UDA - FF.ods |

  @Diff-21
  Scenario Outline: Update UDA - LOV
    Given a user amends UDA VALUE for a specified UDA ID in the UDA_VALUES tab contained in the spreadsheet
    When the source <file> is successfully uploaded
    Then the UDA LOV will be updated in RMS and RMS DB

    Examples:
      | file |
      | Diff-21 Update UDA - LOV.ods |

  @Diff-22
  Scenario Outline: Delete UDA Values - LOV
    Given a user deletes UDA VALUE for a specified UDA LOV in the UDA_VALUES tab contained in the spreadsheet
    When the source <file> is successfully uploaded
    Then the UDA VALUE will be deleted in RMS and RMS DB

    Examples:
      | file |
      | Diff-22 Delete UDA Values - LOV.ods |

  @Diff-23
  Scenario Outline: Update UDA - FF
    Given a user amends UDA FF for a specified UDA ID tab contained in the spreadsheet
    When the source <file> is successfully uploaded
    Then the UDA FF will will be updated in RMS and RMS DB

    Examples:
      | file |
      | Diff-23 Update UDA - FF.ods |

  @Diff-24
  Scenario Outline: Delete UDA - LOV
    Given a user deletes UDA LOV from the UDA tab contained in the UDA Source file template spreadsheet
    When the source <file> is successfully uploaded
    Then the UDA LOV will be deleted in RMS and RMS DB

    Examples:
      | file |
      | Diff-24 Delete UDA - LOV.ods |

  @Diff-25
  Scenario Outline: Delete UDA - FF
    Given a user deletes UDA FF for a specified UDA ID tab contained in the spreadsheet
    When the source <file> is successfully uploaded
    Then the UDA FF will be deleted in RMS and RMS DB

    Examples:
      | file  |
      | Diff-25 Delete UDA - FF.ods |