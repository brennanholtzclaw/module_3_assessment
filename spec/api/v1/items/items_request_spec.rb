require 'rails_helper'

RSpec.describe "a GET request to /api/v1/items" do
  it "returns a 200 JSON response" do
    def parsed_response
      JSON.parse(response.body)
    end

    item1 = Item.create(name: "test name", description: "test description", image_url: "http://www.example.com/test_image.png")

    get "api/v1/items"

    # expect(response.is_json).to eq true
    expect(response.status).to eq 200
    expect(parsed_response[0]["name"]).to eq item1.name
    expect(parsed_response[0]["description"]).to eq item1.description
    expect(parsed_response[0]["image_url"]).to eq item1.image_url
    expect(parsed_response[0]["created_at"]).to eq nil
    expect(parsed_response[0]["updated_at"]).to eq nil
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
