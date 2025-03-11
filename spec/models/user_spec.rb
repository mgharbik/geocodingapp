require "rails_helper"

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it "is invalid with invalid email" do
    user = build(:user, email: "invalidtestexample.com")

    expect(user).not_to be_valid
  end

  it "is invalid with short password" do
    user = build(:user, password: "pass")

    expect(user).not_to be_valid
  end
end
