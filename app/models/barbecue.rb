class Barbecue < ApplicationRecord
  TYPES = ['electric', 'gas', 'coal']
  STARS = [0, 1, 2, 3, 4, 5]

  belongs_to :user
  has_many :bookings

  validates :name, :model, :description, :price, :capacity, :types, presence: true
  mount_uploader :pictures, PhotoUploader
end
