require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest

 setup do
   @photo = photos(:photo_one)
   @photo.image.attach(io: File.open("/Users/ritikverma/Desktop/photogallery/test/fixtures/files/test.jpg"), filename: "test.jpg", content_type: "image/jpg")
 end

  test "should get index" do
    get photos_url
    assert_response :success
  end

  test "should get show" do
    get photo_url(@photo)
    assert_response :success
  end


  test "should create new Photo" do
    assert_difference('Photo.count') do
     post photos_url, params: { photo: { title: @photo.title, user: @photo.user, category_id: @photo.category.id } }
    end
    assert_redirected_to photos_url
  end



 test "should not create a new Photo when incomplete params" do
   @photo.user = nil
   assert_difference('Photo.count',0) do
    post photos_url, params: { photo: { title: @photo.title, user: @photo.user, category_id: @photo.category.id } }
   end
   assert_redirected_to new_photo_path
  end

  test "should delete Photo Post on photos#destroy" do
   assert_difference('Photo.count', -1) do
     delete photo_path(@photo)
   end
   assert_redirected_to photos_url
 end




end
