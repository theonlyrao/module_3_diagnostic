class TransportationFuelController < ApplicationController
  def index
    zip = params["zip"]
    conn = Faraday.new("https://developer.nrel.gov")
    response = conn.get "/api/alt-fuel-stations/v1.json?api_key=#{Pusher.nrel_api_key}&zip=#{zip}&limit=10"
    @stations = JSON.parse(response.body)
  end
end
