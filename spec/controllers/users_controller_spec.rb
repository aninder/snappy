# def test_authentication
#   #check we can log in
#   post :login, :user => { :username => "bob", :password => "test" }
#   assert_not_nil session[:user_id]
#   assert_equal users(:bob).id, session[:user_id]
#   assert_response :redirect
#   assert_redirected_to :action => 'welcome'
# end


# def test_registration
#   #check that we can register and are logged in automatically
#   post :register, :user => { :username => "newuser", :password => "pass", :password_confirmation => "pass", :email => "newuser@web.com" }
#   assert_response :redirect
#   assert_not_nil session[:user_id]
#   assert_redirected_to :action => 'welcome'
# end