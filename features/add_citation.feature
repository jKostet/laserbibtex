Feature: Add article-type citation
  Required fields are:
  - author
  - title
  - journal
  - year
  - volume

  Scenario: User adds a new citation
    Given all required fields are filled
    And citation type is article
    When user tries to add citation
    Then new citation is added

  Scenario Outline: User tries to add a citation without required info
    Given field <field> is not filled
    And citation type is article
    When user tries to add citation
    Then new citation is not added

    Examples:
      |field  |
      |author |
      |title  |
      |journal|
      |year   |
      |volume |