require 'rails_helper'

RSpec.describe "searching items from storedom homepage" do
  it "returns 15 results for 'sennheiser' search" do
      # As a user When I visit the "/"
      visit '/'
      # And I fill in the search box with "sennheiser"
      fill_in 'search', with: "senheiser"
      # And click "search"
      click_on "search"
      # Then my current path should be "/search"
      expect(current_path).to eq search_path
      # And I should see exactly 15 results
      expect(parsed_response).to eq 15
      # And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
      expect(parsed_response[0]["sku"]).to eq "filler"
      expect(parsed_response[0]["name"]).to eq "filler"
      expect(parsed_response[0]["customerAverageReview"]).to eq "filler"
      expect(parsed_response[0]["shortDescription"]).to eq "filler"
      expect(parsed_response[0]["salePrice"]).to eq "filler"
      expect(parsed_response[0]["image"]).to eq "filler"
  end
end

# As a user When I visit the "/" And I fill in the search box with "sennheiser headphones white" and click "search" Then my current path should be "/search" And I should see limited results (at the time of writing, 3. SKUs: 9068155, 9068004, 9068128) And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
#
# The search should hit https://api.bestbuy.com/v1/products and results should be filtered on their longDescription. The search should return any product with the search term included.
# Display the returned products and their attributes returned from the API query in a logical and intuitive html layout. (This does not need to be overly styled).
# If the search yields no result, have an effective UI in place to inform the user.
