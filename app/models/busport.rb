class Busport < ApplicationRecord
  has_many :departing_buses, class_name: "Bus", foreign_key: "from_busport_id" 
  has_many :arriving_buses,  class_name: "Bus", foreign_key: "to_busport_id"
end
