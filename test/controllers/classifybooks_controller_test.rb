require 'test_helper'

class ClassifybooksControllerTest < ActionController::TestCase
  setup do
    @classifybook = classifybooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classifybooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classifybook" do
    assert_difference('Classifybook.count') do
      post :create, classifybook: { condition: @classifybook.condition, user_id: @classifybook.user_id }
    end

    assert_redirected_to classifybook_path(assigns(:classifybook))
  end

  test "should show classifybook" do
    get :show, id: @classifybook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classifybook
    assert_response :success
  end

  test "should update classifybook" do
    patch :update, id: @classifybook, classifybook: { condition: @classifybook.condition, user_id: @classifybook.user_id }
    assert_redirected_to classifybook_path(assigns(:classifybook))
  end

  test "should destroy classifybook" do
    assert_difference('Classifybook.count', -1) do
      delete :destroy, id: @classifybook
    end

    assert_redirected_to classifybooks_path
  end
end
