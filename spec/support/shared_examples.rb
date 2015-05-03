shared_examples "require user" do
  it "redirects to login path" do
    session[:user_id] = nil
    action
    expect(response).to redirect_to login_path
  end
end

shared_examples "require user signup" do
  it "redirects to signup path" do
    session[:user_id] = nil
    action
    expect(response).to redirect_to signup_path
  end
end

shared_examples "hidden from user" do
  it "redirects to root path" do
    set_current_user
    action
    expect(response).to redirect_to root_path
  end
end
