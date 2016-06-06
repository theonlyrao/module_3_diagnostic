require 'rails_helper'

RSpec.describe TransportationFuelController, type: :feature do
  it "gets stations within distance of location" do
    VCR.use_cassette("user_story_1") do
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search?zip=80203"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      visit root_path
      fill_in "Zip", with: "80203"
      click_on "Locate"
      #expect(current_url).to eq("http::localhost/3000/search?zip=380201")
      expect(page).to have_content("10 closest stations")
    end
  end
end
