require 'spec_helper'

describe HomeController do
  describe "GET index" do
    it "should assign next open session to @open_session" do
      open_session = FactoryGirl.create(:session)
      get :index
      assigns(:open_session).should eq open_session
      response.should be_success
    end
  end
end
