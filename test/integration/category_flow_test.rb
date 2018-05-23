require 'test_helper'

class CategoryFlowTest < ActionDispatch::IntegrationTest

  test "should to go to category index when on category home page" do
    get "/categories"
    assert_select "h1" , "Categories"
  end

  test "should display appropirate category names" do
    get categories_url
    assert_select "h2" , "Nature"
  end

  test "should go to categories#show and print photos of that category" do
    photos(:photo_one).image.attach(io: File.open(Dir.pwd+"/test/fixtures/files/test.jpg"), filename: "test.jpg", content_type: "image/jpg")
    get category_url(categories(:one))
    assert_select "h1" , "Nature"
    assert_select "h3" , "BMW"
  end


end
