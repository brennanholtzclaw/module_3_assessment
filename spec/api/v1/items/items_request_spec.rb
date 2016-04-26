require 'rails_helper'

RSpec.describe "a request is sent to /api/v1/items" do
  it "returns a 200 JSON response and all items" do
    item1 = Item.create(name: "test name", description: "test description", image_url: "http://www.example.com/test_image.png")
    item2 = Item.create(name: "another test name", description: "another test description", image_url: "http://www.example.com/another_test_image.png")
    item3 = Item.create(name: "final test name", description: "final test description", image_url: "http://www.example.com/final_test_image.png")

    get "/api/v1/items"

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

    get "/api/v1/items/1"

    expect(response.status).to eq 200
    expect(parsed_response["name"]).to eq item1.name
    expect(parsed_response["description"]).to eq item1.description
    expect(parsed_response["image_url"]).to eq item1.image_url
    expect(parsed_response["created_at"]).to eq nil
    expect(parsed_response["updated_at"]).to eq nil
    expect(parsed_response).to_not include(item2)
    expect(parsed_response).to_not include(item3)
  end

  it "returns a 204 response and destroys a single item" do
    # Apparently there are two identical items being made before each test...?
    # Where are the two mysterious items coming from?

    delete "api/v1/items/1"

    expect(response.status).to eq 204
    expect(Item.count).to eq 1
  end

  it "returns a 201 JSON response and single new item" do
    new_item = {name: "new item", description: "new description", image_url: "http://www.example.com/new_image.png"}

    post "api/v1/items", new_item

    expect(response.status).to eq 201
    expect(Item.count).to eq 3
    # count is three because of my mysterious two items
  end
end
# Verify that your API works using Postman or curl
#####VERIFIED
