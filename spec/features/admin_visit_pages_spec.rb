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

  let!(:student1) { create :user, email: "student1@user.com", first_name: "AAA", last_name: "Pietje", admin: false }
  let!(:student2) { create :user, email: "student2@user.com", first_name: "BBB", last_name: "Pietje", admin: false }
  let!(:student3) { create :user, email: "student3@user.com", first_name: "CCC", last_name: "Pietje", admin: false }
  let!(:student4) { create :user, email: "student4@user.com", first_name: "DDD", last_name: "Pietje", admin: false }


  it "sees a list of all previous pairs" do
    visit pairs_path

    expect(page).to have_text("One + Two")
    expect(page).to have_text("three + four")
  end

  it "sees no matches have been created today" do
    visit pairs_path

    expect(page).to have_text("No matches have been created today!")
  end


  it "can create new pairs" do
    visit pairs_path

    click_link "Generate New Matches"

    expect(page).to have_text("AAA Pietje")
    expect(page).to have_text("BBB Pietje")
    expect(page).to have_text("CCC Pietje")
    expect(page).to have_text("DDD Pietje")

  end
end




describe "Admin interested in users" do
  before {login_as admin}

  let!(:admin) { create :user, email: "current@user.com", first_name: "Jantje", last_name: "Pietje", admin: true }
  let!(:student1) { create :user, email: "student1@user.com", first_name: "AAA", last_name: "Pietje", admin: false }
  let!(:student2) { create :user, email: "student2@user.com", first_name: "BBB", last_name: "Pietje", admin: false }
  let!(:student3) { create :user, email: "student3@user.com", first_name: "CCC", last_name: "Pietje", admin: false }

  it "sees a list of all users" do
    visit users_path

    expect(page).to have_text("Jantje Pietje")
    expect(page).to have_text("AAA Pietje")
    expect(page).to have_text("BBB Pietje")
    expect(page).to have_text("CCC Pietje")

  end
end
