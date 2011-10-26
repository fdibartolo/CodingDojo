class HomeController < ApplicationController
  def index
    open_sessions = Session.where(:status => "Open")

    if open_sessions.count > 0
      @open_session = open_sessions.first!
      @has = true
    else
      @has = false
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @open_session }
    end
  end
end
