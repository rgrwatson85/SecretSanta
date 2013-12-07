class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.js
      format.json {render :json => {:time => OPEN_PROFILE_TIME}}
    end
  end

end