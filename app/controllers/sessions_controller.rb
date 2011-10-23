class SessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.json
  def index
    #@sessions = Session.all
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
    if session[:user_id]
      open_session = Session.where(:status => "Open").first!
      user = User.find_by_id(session[:user_id])
      open_session.users << user

      redirect_to "/home", :notice => "Thank you for registering to the dojo! You will receive assistance confirmation based on the seats available."
    else
      redirect_to login_path
    end
  end
end