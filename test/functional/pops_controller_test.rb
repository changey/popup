require 'test_helper'

class PopsControllerTest < ActionController::TestCase
  setup do
    @pop = pops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pop" do
    assert_difference('Pop.count') do
      post :create, pop: { comment: @pop.comment, lat: @pop.lat, long: @pop.long }
    end

    assert_redirected_to pop_path(assigns(:pop))
  end

  test "should show pop" do
    get :show, id: @pop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pop
    assert_response :success
  end

  test "should update pop" do
    put :update, id: @pop, pop: { comment: @pop.comment, lat: @pop.lat, long: @pop.long }
    assert_redirected_to pop_path(assigns(:pop))
  end

  test "should destroy pop" do
    assert_difference('Pop.count', -1) do
      delete :destroy, id: @pop
    end

    assert_redirected_to pops_path
  end
end
