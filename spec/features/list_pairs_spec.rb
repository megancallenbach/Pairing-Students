require 'rails_helper'

describe "Admin sees the list of pairs" do
  before { login_as admin }

  let(:admin) { create :user, email: "current@user.com", admin: true }

  let!(:pair) { create :pair, title: "Title", user: admin }

  it "shows all pairs" do
    visit pairs_url

    expect(page).to have_text("Title")
  end
end


describe "User cannot see list of pair" do
  before { login_as user }

  let(:user) { create :user, email: "current@user.com", admin: false}

  let!(:pair) { create :pair, title: "Title", user: admin }

  it "does not show pairs" do
    visit pairs_url

    expect(page).not_to have_text("Title")
  end
end
