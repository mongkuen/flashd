def set_current_user
  user = Fabricate(:user)
  session[:user_id] = user.id
end

def current_user
  User.find(session[:user_id])
end

def sign_in(user=nil)
  signin_user = user ||= Fabricate(:user)
  visit login_path
  fill_in "Email", with: signin_user.email
  fill_in "Password", with: signin_user.password
  click_button "Log In"
end
