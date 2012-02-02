Feature: Administrator manages an event's comments

  Background:
    Given I am logged in as an administrator
    And I am viewing an event

  Scenario: Add a comment
    When I add a comment
    Then I should see the message "Comment added"
    And the event timestamp should be updated

  Scenario: Edit a comment 
    When I edit a comment
    Then I should see the message "Comment saved"
    And the event timestamp should be updated

  Scenario: Delete a comment
    When I delete a comment
    Then I should see the message "Comment deleted"
    And the event timestamp should be updated


  # added the feature here as its done at the comment level editing screen

  Scenario: Change the status of an event
    When I change the status of an event
    And the status flag is set to resolved
    Then it should update the event resolved_at timestamp
    And the event timestamp should be updated


