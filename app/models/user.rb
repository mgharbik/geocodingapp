class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :street, presence: true
  validates :city, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }

  after_commit :enqueue_geocoding, on: :create

  private

  def enqueue_geocoding
    GeocodeAddressJob.perform_later(id)
  end
end
