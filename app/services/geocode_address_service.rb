class GeocodeAddressService
  def initialize(user)
    @user = user
  end

  def call
    address = "#{@user.street}, #{@user.city}, #{@user.zip}"
    result = Geocoder.search(address).first

    return if result.blank?

    @user.update(
      latitude: result.coordinates.first,
      longitude: result.coordinates.second
    )

    { latitude: @user.latitude, longitude: @user.longitude }    
  rescue StandardError => e
    # Send to monitoring system (Sentry, New Relic, etc.)
    # This will allow developers to investigate and resolve the issue
    # Sentry.capture_exception(e, extra: { user_id: user.id })

    nil
  end
end
