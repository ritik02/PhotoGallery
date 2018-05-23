require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "should be invalid without Photo title" do
    photos(:one).title = nil
    assert_nil photos(:one).title
    assert_equal false, photos(:one).valid?
  end
end
