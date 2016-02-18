require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  test "should call index and get all contacts" do
    get :index, :format => :json
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should call showbykey and get a contact by its key" do
    get :showbykey, :format => :json, :key => "my_random_key"
    assert_response :success
    assert_not_nil assigns(:contact)
  end

  test "should call show and get a contact by id" do
    get :show, :format => :json, :id => 298486374
    assert_response :success
    assert_not_nil assigns(:contact)
  end

  test "should create a new contact" do
    post :create, { :format => :json, :key => "my_awesome_key" }
    assert_response :created
    assert_equal "my_awesome_key", json_response["key"]
    assert_nil json_response["name"]
    assert_nil json_response["email"]
    assert_nil json_response["message"]
    assert json_response["visits"].empty?
  end

  test "should update an existing contact" do
    put :update, { :format => :json, :key => "my_random_key", :name => "Mike", :email => "mike@example.com", :message => "Hey!" }
    assert_response :ok
    assert_equal "my_random_key", json_response["key"]
    assert_equal "Mike", json_response["name"]
    assert_equal "mike@example.com", json_response["email"]
    assert_equal "Hey!", json_response["message"]
    assert json_response["visits"].empty?
  end

  test "should add a visit" do
    post :addvisit, { :format => :json, :key => "another_random_key", :page => "prices" }
    assert_response :created
    assert_equal "prices", json_response["page"]
    assert json_response["when"]
    assert json_response["contact"]
    assert_equal "Andrey Luiz", json_response["contact"]["name"]
  end

  def json_response
    ActiveSupport::JSON.decode @response.body
  end
end
