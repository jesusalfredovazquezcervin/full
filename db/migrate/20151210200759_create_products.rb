class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :cliente_id
      t.integer :code
      t.string :description
      t.decimal :size_lb, precision: 6, scale: 2
      t.decimal :size_kg, precision: 6, scale: 2
      t.decimal :price, precision: 6, scale: 2
      t.decimal :price_by_kg, precision: 6, scale: 2
      t.string :usability
      t.string :category

      t.timestamps
    end
  end
end
