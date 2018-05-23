require 'test_helper'

class PhotoFlowTest < ActionDispatch::IntegrationTest
  test "should to go to photo index when on home page" do
    get "/"
    assert_select "h1" , "This is our Photo Gallery Website"
  end

  test "can create a Photo post" do
    get new_photo_path
    assert_response :success

    post "/photos",
      params: { photo: { title: "My Picture", user: "My Name", category_id: 1}}
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "h2" ,"My Picture"
  end

  test "should see a New Photo form on photo#new route" do
    get new_photo_path
    assert_select "form" do |elements|
      elements.each do |element|
        assert_select element, "input" , 3
      end
    end
  end
end
