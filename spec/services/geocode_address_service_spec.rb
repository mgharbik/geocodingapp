require 'rails_helper'
require 'ostruct'

RSpec.describe GeocodeAddressService, type: :service do
  let(:user) { create(:user) }
  let(:geocoder_response) { [OpenStruct.new(coordinates: [52.52, 13.405])] }

  let(:service) { described_class.new(user) }

  before do
    allow(Geocoder).to receive(:search).and_return(geocoder_response)
  end

  it "updates user with geocoded data" do
    expect { service.call }.to change { user.reload.latitude }.from(nil).to(52.52)
  end

  context "when address is invalid" do
    let(:geocoder_response) { [] }

    it { expect(service.call).to be_nil }
  end
end
