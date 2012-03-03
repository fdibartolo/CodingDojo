require 'spec_helper'

describe Session do
  describe ".get_upcoming_open_session" do
    before :each do
      Session.create!(:date => Date.today, :status => "Closed")
    end
    
    it "should return no session" do
      Session.get_upcoming_open_session.should be_nil
    end
    
    it "should return the only open session" do
      session = Session.create!(:date => Date.today + 1.day, :status => "Open")
      Session.get_upcoming_open_session.should eq session
    end
    
    it "should return the most recent open session" do
      next_session = Session.create!(:date => Date.today + 1.day, :status => "Open")
      future_session = Session.create!(:date => Date.today + 1.week, :status => "Open")
      Session.get_upcoming_open_session.should eq(next_session)
    end
  end
end