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

  describe '#geocode' do
    let(:user) { create(:user, street: 'Irisring 1', city: 'Berlin', zip: '13089') }

    it 'should geocode address upon creation' do
      expect(user.latitude).not_to be_nil
      expect(user.longitude).not_to be_nil
    end

    context "when address is invalid" do
      let(:user) { build(:user, street: '123 Main St', city: 'Test City', zip: '12345') }

      before { user.valid? }

      it 'should add invalid error' do        
        expect(user.errors[:base]).to include('Please enter a valid address.')
      end
    end
  end

  describe '#address' do
    let(:user) { build(:user, street: '123 Main St', city: 'Test City', zip: '12345') }

    it 'returns the correct address format' do
      expect(user.address).to eq('123 Main St, Test City, 12345')
    end
  end
end
