class HomeController < ApplicationController
  def index
    @open_session = Session.where(:status => "Open").first!

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @session }
    end
  end
end
