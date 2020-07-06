require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "the restaurant gets created without name" do
    restaurant = Restaurant.new
    restaurant.location_id = "12"
    restaurant.address = "Ashok nagar"
    restaurant.image = "https://www.google.com"
    restaurant.description = "Good restaurant"
    assert_not restaurant.save, "Saved the restaurant without name"
  end
  test "the restaurant gets created without location id" do
    restaurant = Restaurant.new
    restaurant.name = "Delights"
    restaurant.address = "Ashok nagar"
    restaurant.image = "https://www.google.com"
    restaurant.description = "Good restaurant"
    assert_not restaurant.save, "Saved the restaurant without location id"
  end
  test "the restaurant gets created without address" do
    restaurant = Restaurant.new
    restaurant.name = "Delights"
    restaurant.location_id = "12"
    restaurant.image = "https://www.google.com"
    restaurant.description = "Good restaurant"
    assert_not restaurant.save, "Saved the restaurant without address"
  end
  test "the restaurant gets created without image" do
    restaurant = Restaurant.new
    restaurant.name = "Delights"
    restaurant.location_id = "12"
    restaurant.description = "Good restaurant"
    restaurant.address = "Ashok nagar"
    assert_not restaurant.save, "Saved the restaurant without image"
  end
  test "the restaurant should get created without description" do
    restaurant = Restaurant.new
    restaurant.name = "Delights"
    restaurant.location_id = "12"
    restaurant.address = "Ashok nagar"
    restaurant.image= "https://www.google.com"
    assert restaurant.save, "Didn't save the restaurant without description"
  end
  test "the restaurant gets created without a proper image url" do
    restaurant = Restaurant.new
    restaurant.name = "Delights"
    restaurant.location_id = "12"
    restaurant.address = "Ashok nagar"
    restaurant.description = "Good restaurant"
    restaurant.image= "https"
    assert_not restaurant.save, "Saved the restaurant without a proper image url"
  end
end
