Given /^there are events within the system$/ do
  #@events = Event.all
  @status = a_saved Status, :name => "test_status", :colour => "ff0000"
  @event = a_saved Event, :title => "test_event", :content => "test content", :status => @status
end

When /^I add an event$/ do
  visit '/admin/events'
  click_link 'Add new event'
  fill_in 'event_title', :with => "My title"
  fill_in 'event_content', :with => "My content"
  select('test_status', :from => 'event_status_id')
  click_button("Save")
end


Then /^I should see the message "([^"]*)"$/ do |arg1|
  page.should have_content(arg1)
  #pending # express the regexp above with the code you wish you had
end

When /^I save the event$/ do
  visit '/admin/events'
  click_link 'test_event'
  fill_in 'event_title', :with => "My new title"
  fill_in 'event_content', :with => "My new content"
  #select('test_status', :from => 'event_status_id')
  click_button("Save")
end

