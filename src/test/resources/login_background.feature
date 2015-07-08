Feature: User Login
  As a Registered User
  I want to login
  In order to access my account

  Background:
    Given I open the app url "https://powerful-citadel-6254.herokuapp.com/"

  @Login
  Scenario: As a registered user I should be able to login
    When I submit my credentials
    Then I should be logged in

  @Login
  Scenario: Example with class
    When I submit my credentials:
      | username | password |
      | s        | P@ssw0rd |
    Then I should be logged in

  @Login
  Scenario Outline: Data driven example
    When I submit "<username>" and "<password>"
    Then I should get "<error>"
    Examples:
      | username | password | error |
      | invalid  | invalid  | Sorry, we were not able to find a user with that username and password. |
      | invalid1 | invalid1 | Sorry, we were not able to find a user with that username and password. |