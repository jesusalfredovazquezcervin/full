class AddPresentationToProduct < ActiveRecord::Migration
  def change
    add_column :products, :presentation, :string
  end
end
