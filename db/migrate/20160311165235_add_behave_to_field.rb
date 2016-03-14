class AddBehaveToField < ActiveRecord::Migration
  def change
    add_column :fields, :behave, :string, :default => "Comun"
  end
end
