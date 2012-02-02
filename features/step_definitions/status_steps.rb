Given /^I am logged in as an administrator$/ do
  #@admin = a_saved User, :email => 'hello@example.com', :admin => true
  # we don't have any administration users yet..
end

Given /^there are statuses within the system$/ do
  @status = a_saved Status, :name => "test_status", :colour => "ff0000"
end

When /^I visit the administrator statuses page$/ do
  visit "/admin/statuses"
end

When /^I click status "([^"]*)"$/ do |arg1|
  @status = Status.find_by_name arg1
  visit "/admin/statuses/#{@status.id}/edit"
end

When /^I assign resolved flag$/ do
  check "status_resolved"
  click_button "Save"
end

Then /^"([^"]*)" should have a resolved flag$/ do |arg1|
  @status = Status.find_by_name arg1
  @status.should be_resolved
end

When /^I revoke resolved flag$/ do
  uncheck "status_resolved"
  click_button "Save"
end

Then /^"([^"]*)" should not have a resolved flag$/ do |arg1|
  @status = Status.find_by_name arg1
  @status.should_not be_resolved
end

