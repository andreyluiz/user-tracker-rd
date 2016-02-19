require 'test_helper'

class Admin::ContactsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get show" do
    get :show, { :key => 'another_random_key' }
    assert_response :success
    assert_not_nil assigns(:contact)
  end

end
