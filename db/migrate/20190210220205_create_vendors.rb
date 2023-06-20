class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.uuid :uuid, null: false, default: 'uuid_generate_v4()'

      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number

      t.timestamps
    end

    add_index :vendors, :uuid, unique: true
  end
end
