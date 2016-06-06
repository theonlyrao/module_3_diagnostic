class SearchController < ApplicationController
  def show
  end

  def index
    zip = params["zip"]
    redirect_to "/search?zip=#{zip}"
  end
end
