Feature: User Login

  @Ignore
  Scenario: As a registered user I should be able to login
    Given I open the app url
    When I submit my credentials
    Then I should be logged in

  @Ignore
  Scenario: Example with class
    Given I open the app url "https://offermanager.ref.o2.co.uk/offerManager"
    When I submit my credentials:
      | username | password |
      | s        | P@ssw0rd |
    Then I should be logged in

  @Ignore
  Scenario Outline: Data driven example
    Given I open the app url "https://offermanager.ref.o2.co.uk/offerManager"
    When I submit "<username>" and "<password>"
    Then I should get "<error>"
    Examples:
      | username | password | error |
      | invalid  | invalid  | Sorry, we were not able to find a user with that username and password. |
      | invalid1 | invalid1 | Sorry, we were not able to find a user with that username and password. |