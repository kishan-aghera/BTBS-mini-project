class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :bus_id

      t.timestamps
    end
  end
end
