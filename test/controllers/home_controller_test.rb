require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get student" do
    get home_student_url
    assert_response :success
  end

  test "should get townhall" do
    get home_mairie_url
    assert_response :success
  end

  test "should get video" do
    get home_video_url
    assert_response :success
  end


end
