require 'spec_helper'

describe SessionsController do

  describe "registration" do

    before :each do
      @user = FactoryGirl.create(:user)
      session[:user_id] = @user.id
    end
    
    it "should redirect to login page when no user is logged in" do
      @open_session = FactoryGirl.create(:session, :status => "Open")
      session[:user_id] = nil
      post :register
      response.should redirect_to :login
    end
    
    it "should redirect to home page when no upcoming session is opened" do
      @open_session = FactoryGirl.create(:session, :status => "Closed")
      post :register
      flash[:notice].should be_nil
      response.should redirect_to '/home'
    end
    
    it "should be successful when user is logged in" do
      @open_session = FactoryGirl.create(:session, :status => "Open")
      @open_session.users.count.should be 0

      post :register

      @open_session.users.count.should be 1
      @open_session.users.first.should eq @user
      response.should redirect_to '/home'
      flash[:notice].should == "Thank you for registering to the dojo! You will receive assistance confirmation based on the seats available."
    end
    
    it "should not be allowed twice, given user is already registered" do
      @open_session = FactoryGirl.create(:session, :status => "Open")
      @open_session.users.count.should be 0

      post :register
      @open_session.users.count.should be 1

      post :register
      @open_session.users.count.should be 1
    end
  end
  
  describe "unregistration" do

    before :each do
      @open_session = FactoryGirl.create(:session, :status => "Open")
      @user = FactoryGirl.create(:user)
    end
    
    it "should remove user from roster" do
      @open_session.users << @user
      @open_session.users.count.should be 1
      post :unregister, :id => @user.id
      @open_session.users.count.should be 0
      response.should redirect_to '/admin'
    end
    
    it "should ignore action if user is not in roster" do
      @open_session.users.count.should be 0
      post :unregister, :id => @user.id
      @open_session.users.count.should be 0
      response.should redirect_to '/admin'
    end
  end
end
