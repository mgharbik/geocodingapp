class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  before_validation :geocode, on: :create

  validates :street, presence: true
  validates :city, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }

  def address
    [street, city, zip].join(', ')
  end

  private

  def geocode
    super

    errors.add(:base, "Please enter a valid address.") if latitude.blank? || longitude.blank?
  rescue StandardError => e
    # Send to monitoring system (Sentry, New Relic, etc.)
    # This will allow developers to investigate and resolve the issue
    # Sentry.capture_exception(e)

    errors.add(:base, "Please try again later.")
  end
end
