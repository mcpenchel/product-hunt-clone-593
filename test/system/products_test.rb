require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the homepage" do
    # visit "/" # this would also work!
    visit root_url

    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "add a new product" do
    # extra-step1) We should sign in
    login_as users(:george)
    # 1) We should go to the products/new
    visit "/products/new"
    # 2) We have to fill the inputs (name and tagline)
    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # 3) We have to click on the submit btn of the form
    click_on 'Create Product'
    # 4) We have to check if we were redirected to the homepage
    assert_equal root_path, page.current_path
    # 5) We check if the new product is being displayed in the homepage
    assert_selector "h2", text: "Le Wagon"
    # extra-step2) We should check that the product has the correct user_id
  end
end
