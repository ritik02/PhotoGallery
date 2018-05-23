require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get show" do
    photos(:photo_one).image.attach(io: File.open("/Users/ritikverma/Desktop/photogallery/test/fixtures/files/test.jpg"), filename: "test.jpg", content_type: "image/jpg")
    get category_url(categories(:one))
    assert_response :success
  end
end
