class AddBusRefToBookings < ActiveRecord::Migration[6.1]
  def change
    # add_reference :bookings, :bus, null: false, foreign_key: true
  end
end
