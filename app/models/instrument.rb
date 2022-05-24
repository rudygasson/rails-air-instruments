class Instrument < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :booking

  validates :type, presence: true
  validates :model, presence: true
  validates :price_per_day, presence: true
  validates :location, presence: true
end
