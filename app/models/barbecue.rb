class Barbecue < ApplicationRecord
  TYPES = ['electric', 'gas', 'coal']

  belongs_to :user
  has_many :bookings

  validates :name, :model, :description, :price, :capacity, :types, presence: true
end
