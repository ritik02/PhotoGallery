require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "should be invalid without Photo title" do
    photos(:one).title = nil
    assert_nil photos(:one).title
    assert_equal false, photos(:one).valid?
  end

  test "should be invalid without Photo Username" do
    photos(:one).user = nil
    assert_nil photos(:one).user
    assert_equal false, photos(:one).valid?
  end

  test "should be invalid without Photo Category_id" do
    photos(:one).category_id = nil
    assert_nil photos(:one).category_id
    assert_equal false, photos(:one).valid?
  end

  test "Photo title should be a String" do
    assert_equal true, photos(:one).title.is_a?(String)
  end

  test "Photo Username should be a String" do
    assert_equal true, photos(:one).user.is_a?(String)
  end

  test "Photo Category_id should be an Integer" do
    assert_equal true, photos(:one).category_id.is_a?(Integer)
  end

end
