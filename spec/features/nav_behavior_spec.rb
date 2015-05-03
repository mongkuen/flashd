require 'rails_helper'

feature "nav bar behavior" do
  let(:user) { Fabricate(:user) }

  scenario "Hides signup and login when logged in" do
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"
    expect(page).not_to have_content("Sign Up")
    expect(page).not_to have_content("Log In")
  end

  scenario "Hides logout when not logged in" do
    visit root_path
    expect(page).not_to have_content("Log Out")
  end
end
