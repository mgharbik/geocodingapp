class GeocodeAddressChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def received(data)
  end

  def unsubscribed
  end
end
