class AddMagnitudeDescriptionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :magnitude_description, :string
  end
end
