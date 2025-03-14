require "rails_helper"

RSpec.feature "User Registration", type: :feature do
  scenario "User signs up successfully" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    fill_in "Street", with: "123 Main St"
    fill_in "City", with: "Berlin"
    fill_in "Zip", with: "10115"

    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("123 Main St")
  end

  scenario "User fails to sign up with missing fields" do
    visit new_user_registration_path

    fill_in "Email", with: ""
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    fill_in "Street", with: ""
    fill_in "City", with: ""
    fill_in "Zip", with: ""

    click_button "Sign Up"

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Street can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("Zip can't be blank")
  end
end
