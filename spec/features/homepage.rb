require 'rails_helper'

describe "Admin viewing the homepage" do
  before { login_as admin }

  let(:admin) { create :user, email: "current@user.com", first_name: "Jantje", last_name: "Pietje", admin: true }

  it "sees the admin homepage" do
    visit root_url

    expect(page).to have_text("Admin Homepage")
  end

  it "does not show student homepage" do
    visit root_url

    expect(page).not_to have_text("Student Homepage")
  end
end
