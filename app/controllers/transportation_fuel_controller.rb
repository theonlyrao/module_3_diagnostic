class TransportationFuelController < ApplicationController
  def index
    zip = params["zip"]
    if params["distance"] == ""
      distance = 6
    else
      distance = params["distance"]
    end
    conn = Faraday.new("https://developer.nrel.gov")
    response = conn.get "/api/alt-fuel-stations/v1/nearest.json?api_key=#{Pusher.nrel_api_key}&location=#{zip}&raidus=#{distance}&fuel_type=ELEC,LPG"
    parsed = JSON.parse(response.body)
    @stations = parsed["fuel_stations"]
    #@stations = TransportationFuelController.paginate(:page => params[:page], :per_page => 10)
  end
end
