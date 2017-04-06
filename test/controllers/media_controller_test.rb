require 'test_helper'

class MediaControllerTest < ActionDispatch::IntegrationTest
  test "should get facebook" do
    get media_facebook_url
    assert_response :success
  end

  test "should get twitter" do
    get media_twitter_url
    assert_response :success
  end

end
