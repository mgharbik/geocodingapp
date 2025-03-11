require "rails_helper"

RSpec.feature "User Registration", type: :feature do
  scenario "User signs up successfully" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"

    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
