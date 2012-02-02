Feature: Administrator manages events

  Background: 
    Given I am logged in as an administrator
    And there are events within the system

  Scenario: Add an event
    When I visit the administrator events page
    And I click "Add new event" 
    And I add in new event details

    Then I should see the message "Event created"

  Scenario: Edit an event
    When I visit the administrator events page
    And I click event "Test event"
    And I update the event details
    And the event should be updated
    And I should see the message "Event saved"

#  Scenario: Delete an event
#    When I visit the administrator events page
#    #And I click event "Test event"
#    And I click the event "Remove" link
#    #And I confirm the popup
#    Then the event "Test event" should be removed
#    And I should see the message "Event deleted"

