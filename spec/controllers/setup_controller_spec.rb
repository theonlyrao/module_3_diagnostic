require 'rails_helper'

RSpec.describe SetupController, type: :controller do
  it "works" do
    VCR.use_cassette("setup") do
      conn = Faraday.new("https://developer.nrel.gov")
      response = conn.get "/api/utility_rates/v3.json?api_key=#{Pusher.nrel_api_key}&lat=35.45&lon=-82.98"
      expect(response.body).to include("Ventyx Research")
    end
  end
end
