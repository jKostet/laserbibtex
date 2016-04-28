Feature: Add article-type citation
  Required fields are:
  - reference
  - author
  - title
  - journal
  - year
  - volume

  Scenario: User adds a new article
    Given all required fields for article are filled
    When user tries to add article
    Then new article is added

  Scenario Outline: User tries to add an article without required info
    Given articles field <field> is not filled
    When user tries to add article
    Then new article is not added

    Examples:
      |field    |
      |reference|
      |author   |
      |title    |
      |journal  |
      |year     |
      |volume   |

  Scenario: User tries to add an article with duplicate reference
    Given all required fields for article are filled
    And articles field reference is in use
    When user tries to add article
    Then new article is not added
