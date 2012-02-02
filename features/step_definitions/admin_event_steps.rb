Given /^there are events within the system$/ do
  #@events = Event.all
  @status = a_saved Status, :name => "test_status", :colour => "ff0000"
  @event = a_saved Event, :title => "Test event", :content => "test content", :status => @status
  @event = a_saved Event, :title => "Another event", :content => "test content", :status => @status
end

#When /^I add an event$/ do
#  visit '/admin/events'
#  click_link 'Add new event'
#  fill_in 'event_title', :with => "My title"
#  fill_in 'event_content', :with => "My content"
#  select('test_status', :from => 'event_status_id')
#  click_button("Save")
#end


Then /^I should see the message "([^"]*)"$/ do |arg1|
  page.should have_content(arg1)
  #pending # express the regexp above with the code you wish you had
end

#When /^I save the event$/ do
#  visit '/admin/events'
#  click_link 'test_event'
#  fill_in 'event_title', :with => "My new title"
#  fill_in 'event_content', :with => "My new content"
#  #select('test_status', :from => 'event_status_id')
  #click_button("Save")
#end


#When /^I delete an event$/ do
#  #visit '/admin/events/'
#  #click_link 'delete_event'
#end

When /^I click event "([^"]*)"$/ do |event_title|
  #pending # express the regexp above with the code you wish you had
  @event = Event.find_by_title!(event_title)
  visit "/admin/events/#{@event.id}/edit"
end

When /^I click the event "Remove" link$/ do 
  #page.evaluate_script('window.confirm = function() { return true; }')
  click 'Remove'
end


Then /^the event "([^"]*)" should be removed$/ do | event_title |
  wait_until { Event.find_by_title(event_title).nil? }
  Event.find_by_title(event_title).should be_nil
end

When /^I visit the administrator events page$/ do
  visit '/admin/events'
end

When /^I update the event details$/ do
  fill_in 'event_title', with: 'Updated title'
  click_button 'Save'
end

When /^the event should be updated$/ do
  @event.reload
  @event.title.should == 'Updated title'
end


When /^I click "Add new event"$/ do 
  visit "/admin/events/new"
end

When /^I add in new event details$/ do
  fill_in 'event_title', :with => "My title"
  fill_in 'event_content', :with => "My content"
  select('test_status', :from => 'event_status_id')
  click_button("Save")
end


When /^I click the "([^"]*)" button$/ do |arg1|
  click_button arg1
end

When /^I confirm the popup$/ do
  page.driver.browser.switch_to.alert.accept    
end


