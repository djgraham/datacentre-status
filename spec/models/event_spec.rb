require 'spec_helper'

describe Event do

  describe "event status" do
    it "should be mandatory" do
      @status = a_saved Status, :name => "Any", :colour => "ff0000"
      @existing = an Event, :title=> 'Test', :content=> 'my content', :scheduled_at => Time.now - 1.second
      @existing.should_not be_valid
      @existing.should have_at_least(1).errors_on(:status)
    end
  end

  describe "An event" do
    it "should be active" do
      @status = a_saved Status, :name => "Any", :colour => "ff0000"
      @existing = a_saved Event, :title=> 'Test', :content=> 'my content', :scheduled_at => Time.now - 1.second, :status => @status
      @existing.should be_active
      @existing.should_not be_resolved 
    end

  end

  describe "An event" do
    it "should be resolved" do
      @status = a_saved Status, :name => "Any", :colour => "ff0000"
      @existing = a_saved Event, :title=> 'Test', :content=> 'my content', :scheduled_at => Time.now - 1.second, :resolved_at => Time.now - 1.second, :status => @status
      @existing.should_not be_active
      @existing.should be_resolved 
    end
  end


end

