require 'test_helper'

class NavEntriesControllerTest < ActionController::TestCase
  setup do
    @nav_entry = nav_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nav_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nav_entry" do
    assert_difference('NavEntry.count') do
      post :create, :nav_entry => @nav_entry.attributes
    end

    assert_redirected_to nav_entry_path(assigns(:nav_entry))
  end

  test "should show nav_entry" do
    get :show, :id => @nav_entry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @nav_entry.to_param
    assert_response :success
  end

  test "should update nav_entry" do
    put :update, :id => @nav_entry.to_param, :nav_entry => @nav_entry.attributes
    assert_redirected_to nav_entry_path(assigns(:nav_entry))
  end

  test "should destroy nav_entry" do
    assert_difference('NavEntry.count', -1) do
      delete :destroy, :id => @nav_entry.to_param
    end

    assert_redirected_to nav_entries_path
  end
end
