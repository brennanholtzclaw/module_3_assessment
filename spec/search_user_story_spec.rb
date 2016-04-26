require 'rails_helper'

RSpec.feature "searching items from storedom homepage" do
  it "returns 15 results for 'sennheiser' search" do
      # As a user When I visit the "/"
      visit '/'
      # And I fill in the search box with "sennheiser"
      fill_in 'search', with: "sennheiser"
      # And click "search"
      click_on "Search"
      # Then my current path should be "/search"
      expect(current_path).to eq search_index_path
      # And I should see exactly 15 results
      expect(page).to have_content("Sennheiser")
      # And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
  # save_and_open_page #Why isn't this working???
  # binding.pry
      expect(page).to have_content("15")
      #This is not a good test - An SKU could have "15" inside
      # expect(page).to have_content("filler")
      # expect(page).to have_content("filler")
      # expect(page).to have_content("filler")
      # expect(page).to have_content("filler")
      # expect(page).to have_content("filler")
  end

  it "returns 6 results for 'sennheiser headphones white' search" do
      # As a user When I visit the "/"
      visit '/'
      # And I fill in the search box with "sennheiser headphones white"
      fill_in 'search', with: "sennheiser headphones white"
      # And click "search"
      click_on "Search"
      # Then my current path should be "/search"
      expect(current_path).to eq search_index_path

      expect(page).to have_content("Sennheiser")

      expect(page).to have_content("6")
      #This is not a good test - An SKU could have "6" inside
      # expect(page).to have_content("filler")
      # expect(page).to have_content("filler")
      # expect(page).to have_content("filler")
      # expect(page).to have_content("filler")
      # expect(page).to have_content("filler")
  end
end


# The search should hit https://api.bestbuy.com/v1/products and results should be filtered on their longDescription. The search should return any product with the search term included.
# Display the returned products and their attributes returned from the API query in a logical and intuitive html layout. (This does not need to be overly styled).
# If the search yields no result, have an effective UI in place to inform the user.
