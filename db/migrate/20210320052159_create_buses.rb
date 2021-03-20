class CreateBuses < ActiveRecord::Migration[6.1]
  def change
    create_table :buses do |t|
      t.integer :from_busport_id
      t.integer :to_busport_id
      t.integer :duration
      t.datetime :scheduled_on

      t.timestamps
    end
  end
end
