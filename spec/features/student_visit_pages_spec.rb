require 'rails_helper'

describe "Student viewing the homepage" do
  before { login_as student }

  let(:student) { create :user, email: "current@user.com", first_name: "Jantje", last_name: "Pietje", admin: false }

  it "sees the student homepage" do
    visit root_url

    expect(page).to have_text("Student Homepage")
  end

  it "does not show Admin homepage" do
    visit root_url

    expect(page).not_to have_text("Admin Homepage")
  end
end



describe "User cannot acces index page" do
  before { login_as student }

  let(:student) { create :user, first_name: "AAA", last_name: "One", admin: false}

  let!(:pair1) { create :pair, student1: "AAA One", student2: "BBB Two"}
  let!(:pair2) { create :pair, student1: "CCC Three", student2: "DDD Four"}

  it "does not show pairs" do
    pending "fixing routes first"
    visit pairs_url

    expect(page).not_to have_text("AAA One")
    expect(page).not_to have_text("BBB Two")
    expect(page).not_to have_text("CCC Three")
    expect(page).not_to have_text("DDD Four")
  end
end
