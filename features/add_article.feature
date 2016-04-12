Feature: Add article-type citation
  Required fields are:
  - reference
  - author
  - title
  - journal
  - year
  - volume

  Scenario: User adds a new citation
    Given all required fields are filled
    When user tries to add citation
    Then new citation is added

  Scenario Outline: User tries to add a citation without required info
    Given field <field> is not filled
    When user tries to add citation
    Then new citation is not added

    Examples:
      |field    |
      |reference|
      |author   |
      |title    |
      |journal  |
      |year     |
      |volume   |