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
      expect(page).to have_link("2")
      expect(page).not_to have_link("3")
    end
  end

  it "gets stations by locationa and distance" do
    VCR.use_cassette("user_story_2") do
# When I visit "/"
# And I fill in the search form with 80203
# And I enter "5" into an optional "Distance" field
# And I click "Locate"
# Then I should see a list of the 10 closest stations of any type within 5 miles sorted by distance
# And the results should share the same format as above
# And I should see about 6 pagination links at the bottom of the results (As of the writing of this story there are 63 results. Number of links should be RESULTS divided by 10)
      visit root_path
      fill_in "Zip", with: "80203"
      fill_in "Distance", with: "80203"
      click_on "Locate"
      expect(page).to have_link("3")
    end
  end
end
