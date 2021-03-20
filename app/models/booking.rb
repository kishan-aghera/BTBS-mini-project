class Booking < ApplicationRecord
  belongs_to :bus
  has_many :passengers
  accepts_nested_attributes_for :passengers
end
