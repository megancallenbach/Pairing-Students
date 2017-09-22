require 'rails_helper'

RSpec.describe User, type: :model do

  it "is not valid without a first name" do
    user = User.new(first_name: nil, last_name: "Bob", email: "jkl@uio.com", password: "1234567")
    expect(user).to_not be_valid
  end

  it "is not valid without a last name" do
    user = User.new(first_name: "nil", last_name: nil, email: "jkl@uio.com", password: "1234567")
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = User.new(first_name: "nil", last_name: "Bob", email: nil, password: "1234567")
    expect(user).to_not be_valid
  end
end
