require 'spec_helper'

describe User do

  before :each do
    @user = FactoryGirl.create(:user)
  end
  
  describe "validation" do
    it "should not pass without specifing enterprise_id" do
      @user.enterprise_id = nil
      @user.valid?.should be_false
      @user.errors.count.should be 1
      @user.errors[:enterprise_id].should == ["can't be blank"]
    end
    it "should not pass without specifing email" do
      @user.email = nil
      @user.valid?.should be_false
      @user.errors.count.should be 1
      @user.errors[:email].should == ["can't be blank"]
    end
    it "should not pass when passwords dont match" do
      @user.password_confirmation = "incorrect"
      @user.valid?.should be_false
      @user.errors.count.should be 1
      @user.errors[:password].should == ["doesn't match confirmation"]
    end
    it "should pass allowing succesfull save" do
      @user.valid?.should be_true
    end
  end
  
  describe "authentication" do
    it "should be valid" do
      user = User.authenticate(@user.enterprise_id, @user.password)
      user.should eq @user
    end
    it "should not be valid" do
      user = User.authenticate(@user.enterprise_id, "incorrect")
      user.should be_nil
    end
  end
end