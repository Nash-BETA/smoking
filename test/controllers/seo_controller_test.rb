require 'test_helper'

class SeoControllerTest < ActionDispatch::IntegrationTest
  test "should get robots" do
    get seo_robots_url
    assert_response :success
  end

  test "should get sitemap" do
    get seo_sitemap_url
    assert_response :success
  end

end
