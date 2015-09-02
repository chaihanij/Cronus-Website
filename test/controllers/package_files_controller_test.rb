require 'test_helper'

class PackageFilesControllerTest < ActionController::TestCase
  setup do
    @package_file = package_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:package_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create package_file" do
    assert_difference('PackageFile.count') do
      post :create, package_file: { build_date: @package_file.build_date, is_public: @package_file.is_public, operating_system_id: @package_file.operating_system_id, package: @package_file.package, release_date: @package_file.release_date, version_id: @package_file.version_id }
    end

    assert_redirected_to package_file_path(assigns(:package_file))
  end

  test "should show package_file" do
    get :show, id: @package_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @package_file
    assert_response :success
  end

  test "should update package_file" do
    patch :update, id: @package_file, package_file: { build_date: @package_file.build_date, is_public: @package_file.is_public, operating_system_id: @package_file.operating_system_id, package: @package_file.package, release_date: @package_file.release_date, version_id: @package_file.version_id }
    assert_redirected_to package_file_path(assigns(:package_file))
  end

  test "should destroy package_file" do
    assert_difference('PackageFile.count', -1) do
      delete :destroy, id: @package_file
    end

    assert_redirected_to package_files_path
  end
end
