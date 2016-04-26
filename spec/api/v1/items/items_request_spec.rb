require 'rails_helper'

RSpec.describe "a GET request to /api/v1/items" do
  it "returns a 200 JSON response" do
    def returned_data(data)
      JSON.parse(data.body)
    end

    get "api/v1/items"

    expect(response.is_json).to eq true
  end
end



# When I send a GET request to /api/v1/items I receive a 200 JSON response containing all items And each item has a name, description, and image_url but not the created_at or updated_at
#
# When I send a GET request to /api/v1/items/1 I receive a 200 JSON response containing the name, description, and image_url but not the created_at or updated_at
#
# When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to /api/v1/items with a name, description, and image_url I receive a 201 JSON response if the record is successfully created And I receive a JSON response containing the name, description, and image_url but not the created_at or updated_at
#
# Verify that your API works using Postman or curl
