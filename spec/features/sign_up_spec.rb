require "rails_helper"

describe "Signing up" do
  before do
    visit root_url
    click_on "Sign Up"
    fill_in "user_email", with: "student1@pairingstudents.com"
    fill_in "user_first_name", with: "Hello"
    fill_in "user_last_name", with: "Lastname"
  end

  context "when password is too short" do
    it "does not allow the user to sign up" do
      fill_in "user_password", with: "short"
      fill_in "user_password_confirmation", with: "short"
      click_on "Sign up"
      expect(page).to have_content "Password is too short"
    end
  end

  context "when password is long enough" do
    it "creates an account for a new user" do
      fill_in "user_password", with: "this-is-more-safe-2017"
      fill_in "user_password_confirmation", with: "this-is-more-safe-2017"
      click_on "Sign up"
      expect(page).to have_content "Homepage"
    end
  end
end
