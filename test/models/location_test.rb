require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  #latitude range -> -90 to -90
  #longtitude range -> -180 to + 180
  test "the location gets created without a name" do
    location = Location.new
    location.latitude = "12.32"
    location.longtitude = "18.32"
    assert_not location.save, "Saved the location without name"
  end 
  test "the location gets created without latitude" do
    location = Location.new
    location.name  = "tnagar"
    location.longtitude = "18.32"
    assert_not location.save, "Saved the location without latitude"
  end 
  test "the location gets created without longtitude" do
    location = Location.new
    location.name =  "tnagar"
    location.latitude = "12.32"
    assert_not location.save, "Saved the location without longtitude"
  end 
  test "the location gets created without correct longtitude" do
    location = Location.new
    location.name = "tnagar"
    location.latitude = "12.32"
    location.longtitude = "180.32"
    assert_not location.save, "Saved the location without correct longtitude"
  end 
  test "the location gets created without correct latitude" do
    location = Location.new
    location.name = "tnagar"
    location.latitude = "90.1"
    location.longtitude = "18.32"
    assert_not location.save, "Saved the location without correct latitude"
  end 
end
