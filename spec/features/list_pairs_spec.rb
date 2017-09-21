require 'rails_helper'

describe "Admin viewing the index page" do
  pending("save for later")
  before {login_as admin}

  let(:admin) { create :user, email: "current@user.com", first_name: "Jantje", last_name: "Pietje", admin: true }
  let(:pair1) { create :pair, student1: "One", student2: "Two"}
  let(:pair2) { create :pair, student1: "three", student2: "four"}

  it "sees a list of all pairs" do
    pending("save for later")
    visit pairs_path
    click_on "Generate New Matches"

    expect(page).to have_text("One")
    expect(page).to have_text("Two")
    expect(page).to have_text("three")
    expect(page).to have_text("four")

  end
end



describe "student cannot see list of pair" do
  before { login_as student }

  let(:student) { create :user, email: "current@user.com",first_name: "Jantje", last_name: "Pietje", admin: false}
  let(:pair1) { create :pair, student1: "One", student2: "Two"}
  let(:pair2) { create :pair, student1: "three", student2: "four"}

  it "does not show pairs" do
    visit pairs_path

    expect(page).not_to have_text("One")
    expect(page).not_to have_text("Two")
    expect(page).not_to have_text("three")
    expect(page).not_to have_text("four")
  end
end
