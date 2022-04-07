require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do

    @admin_user=Sign.create(username:"anilpj", mail:"anilpjmail.com",password:"password",
                            admin: true)
    sign_in_as(@admin_user)
  end

   test "get  new category form and create category" do
     get "/categories/new"
     assert_response :success

     assert_difference'Category.count', 1 do
       post categories_path, params: { category: {name:"sports"  } }
      assert_response :redirect
   end
       follow_redirect!
       assert_response :success
       assert_match "sports",response.body
   end

   test "get new category form and reject category" do
     get "/categories/new"
     assert_response :success

     assert_difference'Category.count' do
       post categories_path, params: { category: {name: " "  } }

   end


       assert_match "sports",response.body
   end
end
