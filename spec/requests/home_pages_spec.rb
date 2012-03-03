require 'spec_helper'

describe "Home pages" do
  describe "index view" do
    it "should display info about upcoming open session" do
      FactoryGirl.create(:session)
      visit root_path
      page.should have_selector('h1', text: 'next session')
    end

    it "should display 'stay tunned' when no sessions are open" do
      FactoryGirl.create(:session, :status => "Closed")
      visit root_path
      page.should have_selector('h1', text: 'no open sessions yet, stay tuned!')
    end    
  end
end
