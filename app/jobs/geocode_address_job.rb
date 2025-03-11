class GeocodeAddressJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find_by(id: user_id)
    return if user.blank?

    GeocodeAddressService.new(user).call
  end
end
