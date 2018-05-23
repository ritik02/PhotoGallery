require 'test_helper'

class PhotoFlowTest < ActionDispatch::IntegrationTest
  setup do
    @photo = photos(:photo_one)
    @photo.image.attach(io: File.open(Dir.pwd+"/test/fixtures/files/test.jpg"), filename: "test.jpg", content_type: "image/jpg")
  end

  test "should to go to photo index when on home page" do
    get "/"
    assert_select "h1" , "This is our Photo Gallery Website"
  end

  test "should see a New Photo form on photo#new route" do
    get new_photo_path
    assert_select "form" do |elements|
      elements.each do |element|
        assert_select element, "input" , 4
      end
    end
  end

  test "Should update Photo" do
   get edit_photo_url(@photo)
   assert_response :success
   patch photo_url(@photo) , params: {photo: {title: "New Photo" , user: @photo.user, category_id: @photo.category.id }}
   assert_response :redirect
   follow_redirect!
   assert_response :success
   assert_select "h1" , "New Photo"
  end


  test "Should not update Photo when invalid params" do
     get edit_photo_url(@photo)
     assert_response :success
     @photo.user = nil
     patch photo_url(@photo) , params: {photo: {title: "New Photo" , user: @photo.user, category_id: @photo.category.id }}
     assert_response :redirect
     follow_redirect!
     assert_response :success
  end

  test "should show same post when clicked" do
    get photo_url(@photo)
    assert_response :success
    assert_select "h1" ,"BMW"
  end

  test "should see a Edit Photo form on photo#edit route" do
    get edit_photo_url(@photo)
    assert_select "form" do |elements|
      elements.each do |element|
        assert_select element, "input" , 5
      end
    end
  end


end
