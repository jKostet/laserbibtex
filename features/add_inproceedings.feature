Feature: Add inproceedings-type citation
  Required fields are:
  - reference
  - author
  - title
  - booktitle
  - year

  Scenario: User adds a new inproceedings
    Given all required fields for inproceedings are filled
    When user tries to add inproceedings
    Then new inproceedings is added

  Scenario Outline: User tries to add an inproceedings without all required fields
    Given inproceedings field <field> is not filled
    When user tries to add inproceedings
    Then new inproceedings is not added

    Examples:
    |field    |
    |reference|
    |author   |
    |title    |
    |booktitle|
    |year     |
    
  Scenario: User tries to add an inproceedings with duplicate reference
    Given all required fields for inproceedings are filled
    And inproceedings field reference is in use
    When user tries to add inproceedings
    Then new inproceedings is not added
