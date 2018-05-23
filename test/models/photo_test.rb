require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  setup do
    photos(:photo_one).image.attach(io: File.open(Dir.pwd+"/test/fixtures/files/test.jpg"), filename: "test.jpg", content_type: "image/jpg")
  end

  test "should be invalid without Photo title" do
    photos(:photo_one).title = nil
    assert_nil photos(:photo_one).title
    assert_equal false, photos(:photo_one).valid?
  end

  test "should be invalid without Photo Username" do
    photos(:photo_one).user = nil
    assert_nil photos(:photo_one).user
    assert_equal false, photos(:photo_one).valid?
  end

  test "should be invalid without Photo Category_id" do
    photos(:photo_one).category_id = nil
    assert_nil photos(:photo_one).category_id
    assert_equal false, photos(:photo_one).valid?
  end

  test "Photo title should be a String" do
    assert_equal true, photos(:photo_one).title.is_a?(String)
  end

  test "Photo Username should be a String" do
    assert_equal true, photos(:photo_one).user.is_a?(String)
  end

  test "Photo Category_id should be an Integer" do
    assert_equal true, photos(:photo_one).category_id.is_a?(Integer)
  end

  test "Image should be attached" do
    photos(:photo_one).save!
    assert_equal true, photos(:photo_one).image.attached?
  end

  test "Image should not be attached when invalid type" do
    photos(:photo_one).image.attach(io: File.open(Dir.pwd+"/test/fixtures/files/test1.pdf"), filename: "test1.pdf", content_type: "application/pdf")
    assert_raises "Error" do
        photos(:photo_one).save!
    end
  end



end
