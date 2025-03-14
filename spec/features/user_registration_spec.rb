require "rails_helper"

RSpec.feature "User Registration", type: :feature do
  scenario "User signs up successfully" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    fill_in "Street", with: "Irisring 1"
    fill_in "City", with: "Berlin"
    fill_in "Zip", with: "13089"

    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Irisring 1")
    expect(page).to have_content("Latitude:")
    expect(page).to have_content("Longitude:")

    GeocodeAddressJob.perform_now(User.last.id)

    visit root_path
    expect(page).to have_content("Latitude: 52.566")
    expect(page).to have_content("Longitude: 13.448")
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
