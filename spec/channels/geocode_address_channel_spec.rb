require 'rails_helper'

RSpec.describe GeocodeAddressChannel, type: :channel do
  let(:user) { create(:user) }

  before do
    stub_connection current_user: user
  end

  it "subscribes to a stream" do
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_for(user)
  end

  it "broadcasts geolocation data" do
    expect {
      GeocodeAddressChannel.broadcast_to(user, { latitude: 52.52, longitude: 13.405 })
    }.to have_broadcasted_to(user).with(latitude: 52.52, longitude: 13.405)
  end
end
