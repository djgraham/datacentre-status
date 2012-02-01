Given /^I am logged in as an administrator$/ do
  #@admin = a_saved User, :email => 'hello@example.com', :admin => true
  #visit "/admin/statuses"
end

Given /^there are statuses within the system$/ do
  @status = a_saved Status, :name => "test_status", :colour => "ff0000"
end

When /^I visit the administrator statuses page$/ do
  visit "/admin/statuses"
end

When /^I click "([^"]*)"$/ do |arg1|
  #pending # express the regexp above with the code you wish you had
  #@status = Status.where(:name => arg1).first
  visit "/admin/statuses/#{@status.id}/edit"
end

When /^I assign resolved flag$/ do
  #pending # express the regexp above with the code you wish you had
  check "status_resolved"
  click_button "Save"
end

Then /^"([^"]*)" should have a resolved flag$/ do |arg1|
  #@status = Status.where(:name => arg1)
  @status.should be_resolved
end

When /^I revoke resolved flag$/ do
  #pending # express the regexp above with the code you wish you had
  uncheck "status_resolved"
  click_button "Save"
end

Then /^"([^"]*)" should not have a resolved flag$/ do |arg1|
  #@status = Status.where(:name => arg1)
  @status.should_not be_resolved
end

