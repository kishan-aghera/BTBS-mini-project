class CreateBusports < ActiveRecord::Migration[6.1]
  def change
    create_table :busports do |t|
      t.string :code

      t.timestamps
    end
  end
end
