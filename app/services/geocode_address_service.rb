class GeocodeAddressService
  def initialize(user)
    @user = user
  end

  def call
    address = "#{@user.street}, #{@user.city}, #{@user.zip}"
    result = Geocoder.search(address).first

    @user.update(
      latitude: result.coordinates.first,
      longitude: result.coordinates.second
    ) if result.present?
  rescue StandardError => e
    # Send to monitoring system (Sentry, New Relic, etc.)
    # This will allow developers to investigate and resolve the issue
    # Sentry.capture_exception(e, extra: { user_id: user.id })
  end
end
