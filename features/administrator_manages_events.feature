Feature: Administrator manages events

  Background: 
    Given I am logged in as an administrator
    And there are events within the system

  Scenario: Add an event
    When I add an event
    Then I should see the message "Event created"

  Scenario: Edit an event
    When I save the event
    Then I should see the message "Event saved"
