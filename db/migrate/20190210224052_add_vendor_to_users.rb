class AddVendorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :vendor_id, :integer
    add_column :users, :role, :integer, default: :sales
  end
end
