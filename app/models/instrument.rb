class Instrument < ApplicationRecord
  belongs_to :user

  validates :type, presence: true
  validates :model, presence: true
  validates :price_per_day, presence: true
  validates :location, presence: true
end
