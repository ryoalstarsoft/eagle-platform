class AddMaterialTypeToMaterial < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :material_type_id, :integer
    
    remove_column :materials, :name, :string
    remove_column :materials, :unit, :integer
    
    rename_column :materials, :price, :cost_ton
    add_column :materials, :cost_load, :decimal, precision: 8, scale: 2
    add_column :materials, :cost_yard, :decimal, precision: 8, scale: 2
  end
end
