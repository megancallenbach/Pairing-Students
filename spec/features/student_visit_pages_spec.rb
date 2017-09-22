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



describe "Student trying to visit  pair index page" do
  before { login_as student }

  let(:student) { create :user, first_name: "AAA", last_name: "One", admin: false}

  let!(:pair1) { create :pair, student1: "AAA One", student2: "BBB Two"}
  let!(:pair2) { create :pair, student1: "CCC Three", student2: "DDD Four"}

  it "does not see pairs" do
    visit pairs_path

    expect(page).to have_text("You are not authorized to view this page.")
  end
end

describe "Student interested in other users" do
  before {login_as student1}

  let!(:student1) { create :user, email: "student1@user.com", first_name: "AAA", last_name: "Pietje", admin: false }
  let!(:student2) { create :user, email: "student2@user.com", first_name: "BBB", last_name: "Pietje", admin: false }
  let!(:student3) { create :user, email: "student3@user.com", first_name: "CCC", last_name: "Pietje", admin: false }

  it "does not see the user index" do
    visit users_path

    expect(page).not_to have_text("AAA Pietje")
    expect(page).not_to have_text("BBB Pietje")
    expect(page).not_to have_text("CCC Pietje")
    expect(page).to have_text("You are being redirected.")

  end
end

describe "Student interested in own pair" do
  before {login_as student1}

  let!(:student1) { create :user, email: "student1@user.com", first_name: "AAA", last_name: "Pietje", admin: false }
  let!(:student2) { create :user, email: "student2@user.com", first_name: "BBB", last_name: "Pietje", admin: false }
  let!(:student3) { create :user, email: "student3@user.com", first_name: "CCC", last_name: "Pietje", admin: false }

  let!(:pair) {create :pair, student1: "AAA Pietje", student2: "BBB Pietje"}

  it "only sees own pair" do
   pending "update show page"
   visit pair_path(pair)

   expect(page).to have_text("AAA Pietje")
   expect(page).to have_text("BBB Pietje")
   expect(page).not_to have_text("CCC Pietje")
 end
end
