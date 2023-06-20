class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.integer :vendor_id
      t.string :name
      t.string :email

      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number

      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
