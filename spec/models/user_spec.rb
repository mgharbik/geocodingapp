require "rails_helper"

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:zip) }

  it { should validate_numericality_of(:zip).only_integer }
  it { should validate_length_of(:zip).is_equal_to(5) }

  it "is invalid with invalid email" do
    user = build(:user, email: "invalidtestexample.com")

    expect(user).not_to be_valid
  end

  it "is invalid with short password" do
    user = build(:user, password: "pass")

    expect(user).not_to be_valid
  end
end
