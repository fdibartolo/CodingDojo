class AuthenticationsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:enterprise_id], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to "/home"#, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid user or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/home"#, :notice => "Logged out!"
  end
end
