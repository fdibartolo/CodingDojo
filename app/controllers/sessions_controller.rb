class SessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.where(:status => "Closed")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessions }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = Session.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session }
    end
  end

  def register
    if not session[:user_id]
      redirect_to login_path
      return
    end  
    
    open_session = Session.get_upcoming_open_session
      
    if not open_session
      redirect_to "/home"
      return
    end
    
    user = User.find_by_id(session[:user_id])
    open_session.users << user unless open_session.users.include? user

    redirect_to "/home", :notice => "Thank you for registering to the dojo! You will receive assistance confirmation based on the seats available."
  end
  
  def unregister
    open_session = Session.get_upcoming_open_session
    
    user_to_remove = User.find(params[:id])
    open_session.users.destroy(user_to_remove)
    
    open_session.save
    redirect_to "/admin"
  end
end