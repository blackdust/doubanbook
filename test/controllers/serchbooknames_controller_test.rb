require 'test_helper'

class SerchbooknamesControllerTest < ActionController::TestCase
  setup do
    @serchbookname = serchbooknames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serchbooknames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serchbookname" do
    assert_difference('Serchbookname.count') do
      post :create, serchbookname: { email: @serchbookname.email, word: @serchbookname.word }
    end

    assert_redirected_to serchbookname_path(assigns(:serchbookname))
  end

  test "should show serchbookname" do
    get :show, id: @serchbookname
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serchbookname
    assert_response :success
  end

  test "should update serchbookname" do
    patch :update, id: @serchbookname, serchbookname: { email: @serchbookname.email, word: @serchbookname.word }
    assert_redirected_to serchbookname_path(assigns(:serchbookname))
  end

  test "should destroy serchbookname" do
    assert_difference('Serchbookname.count', -1) do
      delete :destroy, id: @serchbookname
    end

    assert_redirected_to serchbooknames_path
  end
end
