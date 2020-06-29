require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
     #has_secure_password
    @user = users(:one)
  end

  # test "should get index" do
  #   get '/' , as: :json
  #   assert_response :success
  # end

  test "should create user" do
    assert_difference 'User.count', 0 do
      post '/signup', params: { username:@user.username, password:@user.password_digest, phone_number:@user.phone_number }, as: :json 
    end
    # puts @user.username
    # puts @user.password_digest
    # puts @user.phone_number
    # post '/signup', params: { username:@user.username, password:@user.password_digest, phone_number:@user.phone_number }, as: :json
    assert_response :success
  end

  # test "should show user" do
  #   post user_url, params: { Authorization:"Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5ODAxOTA5Njh9.AFPMo3T6dYXpcMRIDiAq5A-QnAguB-1PZR98NZxC1y0"} , as: :json
  #   assert_response :success
  # end

  # test "should login user" do
  #   post '/login', params: { username:"MyString", password:"MyString" } , as: :json
  #   assert_response 200
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user), as: :json
  #   end

  #   assert_response 204
  # end
end
