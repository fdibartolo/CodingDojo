require 'spec_helper'

describe HomeHelper do
  # 'helper' is an instance of ActionView::Base configured with the HomeHelper and all of Rails' built-in helpers

  before :each do
    @open_session = FactoryGirl.create(:session)
    @user = FactoryGirl.create(:user)
    
    session[:user_id] = @user.id
  end

  it "should indicate user is not registered when there is no open session" do
    @open_session.status = "Closed"
    helper.current_user_registered?.should be_false
  end

  it "should indicate user is not registered given no one in http session" do
    session[:user_id] = nil
    helper.current_user_registered?.should be_false
  end

  it "should indicate user is not registered" do
    helper.current_user_registered?.should be_false
  end

  it "should indicate user is registered" do
    @open_session.users << @user
    helper.current_user_registered?.should be_true
  end
end
