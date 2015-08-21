require "test_helper"

class UsersControllerTest < ActionController::TestCase
  def user
    @user ||= users :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    params = {address: "123 Main St", city: "My City", dob: "1955-05-05", email: "j@j.org", first_name: "jane", last_name: "Doe", password: "secret123", password_confirmation: "secret123", state: "FL" }
    post :create, { user: params}
    assert_response :redirect
  end

  def test_show
    get :show, id: user
    assert_response :success
  end

  def test_edit
    get :edit, id: user
    assert_response :success
  end

  def test_update
    put :update, id: user, user: { address: user.address, city: user.city, dob: user.dob, email: user.email, first_name: user.first_name, last_name: user.last_name, state: user.state }
    assert_response :success
  end

  def test_destroy
    assert_difference("User.count", -1) do
      delete :destroy, id: user
    end

    assert_redirected_to users_path
  end
end
