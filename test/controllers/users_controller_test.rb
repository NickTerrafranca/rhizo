require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:stabby)
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test "should get signup" do
    get signup_path
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should get show" do
    get user_url(@user)
    assert_response :success
  end

  # test "should get create" do
  #   post create_user_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   post update_users_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   post destroy_users_url
  #   assert_response :success
  # end

end
