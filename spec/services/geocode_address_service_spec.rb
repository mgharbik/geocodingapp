require 'rails_helper'
require 'ostruct'

RSpec.describe GeocodeAddressService do
  let(:user) { create(:user) }
  let(:service) { described_class.new(user) }

  before do
    allow(Geocoder).to receive(:search).and_return([
      OpenStruct.new(latitude: 52.52, longitude: 13.405)
    ])
  end

  it "updates user with geocoded data" do
    expect { service.call }.to change { user.reload.latitude }.from(nil).to(52.52)
  end
end
