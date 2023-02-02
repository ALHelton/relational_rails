class CreatePalettes < ActiveRecord::Migration[5.2]
  def change
    create_table :palettes do |t|
      t.string :name
      t.string :brand
      t.integer :cartridge_capacity
      t.boolean :recyclable

      t.timestamps
    end
  end
end
