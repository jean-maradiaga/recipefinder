require 'test_helper'

class CoursesMenusControllerTest < ActionController::TestCase
  setup do
    @courses_menu = courses_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create courses_menu" do
    assert_difference('CoursesMenu.count') do
      post :create, courses_menu: { course_name: @courses_menu.course_name, day: @courses_menu.day, menu_id: @courses_menu.menu_id }
    end

    assert_redirected_to courses_menu_path(assigns(:courses_menu))
  end

  test "should show courses_menu" do
    get :show, id: @courses_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @courses_menu
    assert_response :success
  end

  test "should update courses_menu" do
    patch :update, id: @courses_menu, courses_menu: { course_name: @courses_menu.course_name, day: @courses_menu.day, menu_id: @courses_menu.menu_id }
    assert_redirected_to courses_menu_path(assigns(:courses_menu))
  end

  test "should destroy courses_menu" do
    assert_difference('CoursesMenu.count', -1) do
      delete :destroy, id: @courses_menu
    end

    assert_redirected_to courses_menus_path
  end
end
