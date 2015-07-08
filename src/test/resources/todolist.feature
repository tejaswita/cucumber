Feature: TodoList
  As a task creator
  I want to create a todo list
  In order to organise my day

  Scenario: I should be able to add a task in my todolist
    Given I open my todolists
    When I click on add task button
    Then Task form should be displayed
    When I fill in the details for task "Learn Functional Testing"
    And I submit the form
    Then Task for "Learn Functional Testing" should be displayed

  Scenario: I should be able to change my task in the todolist
    Given I open my todolists
    And I have a task for "Learn Functional Testing" present in the list
    When I click on Edit button of the task "Learn Functional Testing"
    Then Task "Learn Functional Testing" should be displayed in editable form
    When I change the the task to "Learning functional testing and cucumber"
    And I submit the form
    Then Task for "Learning functional testing and cucumber" should be displayed

  Scenario: I should be able to delete my task from the todolist
    Given I open my todolists
    And I have a task for "Learn Functional Testing" present in the list
    When I click on Delete button of the task "Learn Functional Testing"
    Then Task "Learn Functional Testing" should be removed from the list

  Scenario: I should not be able to add duplicate tasks in the todolist
    Given I open my todolists
    And I have a task for "Learn Functional Testing" present in the list
    When I click on add task button
    Then Task form should be displayed
    When I fill in the details for task "Learn Functional Testing"
    And I submit the form
    Then I should get error message "Task already exists in your list"
