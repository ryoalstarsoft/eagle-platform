class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.integer :vendor_id
      t.string :number
      t.boolean :is_owned, default: false
      t.date :last_maintained_on
      t.integer :maintenance_period
      t.string :owner_name
      t.boolean :is_active, default: true
      t.boolean :is_available, default: true

      t.timestamps
    end
  end
end
