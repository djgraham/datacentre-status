require 'spec_helper'

describe Status do
  describe "name" do
    it "should be mandatory" do
      @status = a Status, :name => '', :colour => 'ffffff'
      @status.should_not be_valid
      @status.should have_at_least(1).errors_on(:name)
    end

    it "should be unique" do
      @existing = a_saved Status, :name => 'Test', :colour => 'ffffff'
      @status = a Status, :name => 'Test', :colour => 'ffffff'
      @status.should_not be_valid
      @status.should have_at_least(1).errors_on(:name)
    end

  end

  describe "colour" do
    it "should be mandatory" do
      @status = a Status, :colour=> '', :name => 'Test'
      @status.should_not be_valid
      @status.should have_at_least(1).errors_on(:colour)
    end
  end

end



