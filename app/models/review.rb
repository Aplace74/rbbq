class Review < ApplicationRecord
  STARS = [0, 1, 2, 3, 4, 5]
  belongs_to :user
  belongs_to :barbecue

  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: STARS }
end
