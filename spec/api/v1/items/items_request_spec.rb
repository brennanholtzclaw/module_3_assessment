require 'rails_helper'

RSpec.describe "a GET request to /api/v1/items" do
  it "returns a 200 JSON response and all items" do
    item1 = Item.create(name: "test name", description: "test description", image_url: "http://www.example.com/test_image.png")
    item2 = Item.create(name: "another test name", description: "another test description", image_url: "http://www.example.com/another_test_image.png")
    item3 = Item.create(name: "final test name", description: "final test description", image_url: "http://www.example.com/final_test_image.png")

    get "api/v1/items"

    expect(response.status).to eq 200
    expect(parsed_response[0]["name"]).to eq item1.name
    expect(parsed_response[0]["description"]).to eq item1.description
    expect(parsed_response[0]["image_url"]).to eq item1.image_url
    expect(parsed_response[0]["created_at"]).to eq nil
    expect(parsed_response[0]["updated_at"]).to eq nil
  end

  it "returns a 200 JSON response and a single item" do
    item1 = Item.create(name: "test name", description: "test description", image_url: "http://www.example.com/test_image.png")
    item2 = Item.create(name: "another test name", description: "another test description", image_url: "http://www.example.com/another_test_image.png")
    item3 = Item.create(name: "final test name", description: "final test description", image_url: "http://www.example.com/final_test_image.png")

    get "api/v1/items/1"

    expect(response.status).to eq 200
    expect(parsed_response["name"]).to eq item1.name
    expect(parsed_response["description"]).to eq item1.description
    expect(parsed_response["image_url"]).to eq item1.image_url
    expect(parsed_response["created_at"]).to eq nil
    expect(parsed_response["updated_at"]).to eq nil
    expect(parsed_response).to_not include(item2)
    expect(parsed_response).to_not include(item3)
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
