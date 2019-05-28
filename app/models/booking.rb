class Booking < ApplicationRecord
  belongs_to :barbecue
  belongs_to :user

  validates :start_date, :end_date, presence: true, inclusion: { in: (Date.today..Date.today+5.years), message: "Invalid date" }

end
