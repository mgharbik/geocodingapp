class GeocodeAddressJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find_by(id: user_id)
    return if user.blank?

    coordinates =  GeocodeAddressService.new(user).call

    GeocodeAddressChannel.broadcast_to(user, coordinates)
  end
end
