class TransportationFuelController < ApplicationController
  def index
    zip = params["zip"]
    conn = Faraday.new("https://developer.nrel.gov")
    response = conn.get "/api/alt-fuel-stations/v1/nearest.json?api_key=#{Pusher.nrel_api_key}&location=#{zip}"
    @stations = JSON.parse(response.body["fuel_stations"])
  end
end
