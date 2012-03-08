require 'spec_helper'

describe "Home pages" do
  describe "index view with no upcoming open session" do
    it "should display 'stay tunned' banner" do
      FactoryGirl.create(:session, :status => "Closed")
      visit root_path
      page.should have_selector('h1', text: 'no open sessions yet, stay tuned!')
    end    
  end

  describe "index view with upcoming open session" do
    before :each do
      FactoryGirl.create(:session)
      visit root_path
    end

    it "should display info about it" do
      page.should have_selector('h1', text: 'next session')
    end
  end
end
