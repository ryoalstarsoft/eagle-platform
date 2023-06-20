class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.integer :supplier_id
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.integer :unit #[:yard, :ton, :pound, :piece]

      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
