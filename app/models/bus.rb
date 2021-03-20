class Bus < ApplicationRecord
  belongs_to :from_busport, class_name: "Busport", foreign_key: "from_busport_id"
  belongs_to :to_busport, class_name: "Busport", foreign_key: "to_busport_id"
  has_many :bookings
  has_many :passengers, through: :bookings
end
