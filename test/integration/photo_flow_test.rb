require 'test_helper'

class PhotoFlowTest < ActionDispatch::IntegrationTest
  test "should to go to photo index when on home page" do
    get "/"
    assert_select "h1" , "This is our Photo Gallery Website"
  end

  test "can create a Photo post" do
    get new_photo_path
    assert_response :success
    @photos = photos(:photo_one)
    post "/photos",
      params: { photo: { title: @photos.title, user: @photos.user, category_id: @photos.category.id}}
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "h2" ,"BMW"
  end

  test "should see a New Photo form on photo#new route" do
    get new_photo_path
    assert_select "form" do |elements|
      elements.each do |element|
        assert_select element, "input" , 4
      end
    end
  end
end
