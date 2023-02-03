class CreatePaints < ActiveRecord::Migration[5.2]
  def change
    create_table :paints do |t|
      t.string :paint_name
      t.string :medium
      t.integer :series
      t.boolean :opaque
      t.references :palettes, foreign_key: true

      t.timestamps
    end
  end
end
