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


describe "Admin viewing the index page" do
  before {login_as admin}

  let(:admin) { create :user, email: "current@user.com", first_name: "Jantje", last_name: "Pietje", admin: true }
  let!(:pair1) { create :pair, student1: "One", student2: "Two", date: (Date.today-2)}
  let!(:pair2) { create :pair, student1: "three", student2: "four", date: (Date.today-3)}
  let!

  it "sees a list of all previous pairs" do
    visit pairs_path

    expect(page).to have_text("One")
    expect(page).to have_text("Two")
    expect(page).to have_text("three")
    expect(page).to have_text("four")

  end

end
