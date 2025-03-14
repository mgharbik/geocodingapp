require 'rails_helper'

RSpec.describe GeocodeAddressJob, type: :job do
  let(:user) { create(:user) }
  let(:geocode_service_double) { instance_double("GeocodeAddressService") }

  before do
    allow(GeocodeAddressService).to receive(:new).with(user).and_return(geocode_service_double)
    allow(geocode_service_double).to receive(:call)
  end

  it "calls the GeocodeAddressService" do
    described_class.perform_now(user.id)

    expect(geocode_service_double).to have_received(:call)
  end
end
