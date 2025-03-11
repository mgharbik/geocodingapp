require "rails_helper"

RSpec.feature "User Login", type: :feature do
  let!(:user) { create(:user, password: "password123") }

  scenario "User logs in successfully" do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password123"
    click_button "Login"

    expect(page).to have_content("Signed in successfully")
  end
end
