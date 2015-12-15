class AddMagnitudeToProduct < ActiveRecord::Migration
  def change
    remove_column :products, :weight_kg
    remove_column :products, :weight_lb
    add_column :products, :magnitude, :decimal, precision: 6, scale: 2
    add_column :products, :measure, :string
  end
end
