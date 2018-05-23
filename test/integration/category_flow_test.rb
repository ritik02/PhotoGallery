require 'test_helper'

class CategoryFlowTest < ActionDispatch::IntegrationTest

  test "should to go to category index when on category home page" do
    get "/categories"
    assert_select "h1" , "Categories"
  end

end
