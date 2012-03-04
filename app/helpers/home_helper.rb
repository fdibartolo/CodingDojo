module HomeHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_registered?
    open_session = Session.get_upcoming_open_session
    
    if not (open_session || session[:user_id])
      return false
    end
    
    open_session.users.include? current_user
  end
end
