require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "the truth" do
   assert true
  end

  test "should be invalid without Category name" do
    categories(:one).name = nil
    assert_nil categories(:one).name
    assert_equal false, categories(:one).valid?
  end
end
