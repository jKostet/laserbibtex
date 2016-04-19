Feature: Add book-type citation
  Required fields are:
  - reference
  - author
  - title
  - publisher
  - year

  Scenario: User adds new book
    Given all required fields for book are filled
    When user tries to add book
    Then new book is added

Scenario Outline: User tries to add a book without required info
  Given books field <field> is not filled
  When user tries to add book
  Then new book is not added

  Examples:
    |field|
    |reference|
    |author|
    |title|
    |publisher|
    |year|
