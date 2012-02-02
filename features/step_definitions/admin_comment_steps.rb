Given /^I am viewing an event$/ do
  @status = a_saved Status, :name => "test_status", :colour => "ff0000"
  @event = a_saved Event, :title => "test_event", :content => "test content", :status => @status
end


When /^I add a comment$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the event timestamp should be updated$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I edit a comment$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I delete a comment$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I change the status of an event$/ do
  pending # express the regexp above with the code you wish you had
end

When /^the status flag is set to resolved$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^it should update the event resolved_at timestamp$/ do
  pending # express the regexp above with the code you wish you had
end

