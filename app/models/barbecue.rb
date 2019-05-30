class Barbecue < ApplicationRecord
  TYPES = ['electric', 'gas', 'coal', 'other']
  STARS = [0, 1, 2, 3, 4, 5]

  include PgSearch
  multisearchable against: [ :name, :description, :model, :types, :capacity ]

  belongs_to :user
  has_many :bookings
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :model, :description, :price, :capacity, :types, presence: true
  
  mount_uploader :pictures, PhotoUploader
end
