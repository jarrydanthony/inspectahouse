require 'test_helper'

class InspectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inspections_new_url
    assert_response :success
  end

  test "should get edit" do
    get inspections_edit_url
    assert_response :success
  end

  test "should get index" do
    get inspections_index_url
    assert_response :success
  end

  test "should get show" do
    get inspections_show_url
    assert_response :success
  end

end
