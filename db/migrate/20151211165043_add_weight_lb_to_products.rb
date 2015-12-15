class AddWeightLbToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :size_lb
    remove_column :products, :size_kg
    add_column :products, :weight_kg, :decimal, precision: 6, scale: 2
    add_column :products, :weight_lb, :decimal, precision: 6, scale: 2
  end
end
