require 'test_helper'

class PackagesControllerTest < ActionController::TestCase
  setup do
    @package = packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create package" do
    assert_difference('Package.count') do
      post :create, package: { emergency_package: @package.emergency_package, is_public: @package.is_public, name: @package.name, notwork_package: @package.notwork_package, operating_system_id: @package.operating_system_id, package: @package.package, product_id: @package.product_id, release_note: @package.release_note, release_package: @package.release_package, version: @package.version }
    end

    assert_redirected_to package_path(assigns(:package))
  end

  test "should show package" do
    get :show, id: @package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @package
    assert_response :success
  end

  test "should update package" do
    patch :update, id: @package, package: { emergency_package: @package.emergency_package, is_public: @package.is_public, name: @package.name, notwork_package: @package.notwork_package, operating_system_id: @package.operating_system_id, package: @package.package, product_id: @package.product_id, release_note: @package.release_note, release_package: @package.release_package, version: @package.version }
    assert_redirected_to package_path(assigns(:package))
  end

  test "should destroy package" do
    assert_difference('Package.count', -1) do
      delete :destroy, id: @package
    end

    assert_redirected_to packages_path
  end
end
