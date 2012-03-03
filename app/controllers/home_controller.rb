class HomeController < ApplicationController
  def index
    @open_session = Session.get_upcoming_open_session

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @open_session }
    end
  end
end
