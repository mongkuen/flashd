require 'rails_helper'

feature "login invalid" do
  let(:user) { Fabricate(:user) }

  scenario "it shows error message" do
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: ""
    click_button "Log In"
    expect(page).to have_content("Login Incorrect")
  end
end
