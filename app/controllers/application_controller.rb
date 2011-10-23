class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :current_user_registered?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_registered?

    if not session[:user_id]
      return false
    end

    open_session = Session.where(:status => "Open").first!
    open_session.users.each do |user|
      if user.enterprise_id == current_user.enterprise_id
        return true
      end
    end

    return false

#    if session[:user_id] and Session.where(:status => "Open").users.include?(current_user)
#      true
#    else
#      false
#    end
  end
end
