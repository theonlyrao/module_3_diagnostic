class TransportationFuelController < ApplicationController
  def index
    zip = params["zip"]
    conn = Faraday.new("https://developer.nrel.gov")
    response = conn.get "/api/alt-fuel-stations/v1/nearest.json?api_key=#{Pusher.nrel_api_key}&location=#{zip}&raidus=6&fuel_type=ELEC,LPG"
    parsed = JSON.parse(response.body)
    @stations = parsed["fuel_stations"]
  end
end
