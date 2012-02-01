Feature: Administrator manages statuses

  Background: 
    Given I am logged in as an administrator
    And there are statuses within the system

  Scenario: Making a status a resolved status flag

    When I visit the administrator statuses page
    And I click "test_status"
    And I assign resolved flag
    Then "test_status" should have a resolved flag

  Scenario: Revoking resolved status flag

    When I visit the administrator statuses page
    And I click "test_status"
    And I assign resolved flag
    When I visit the administrator statuses page
    And I click "test_status"
    And I revoke resolved flag
    Then "test_status" should not have a resolved flag

