class AddTempToReport < ActiveRecord::Migration
  def change
    add_column :reports, :temp, :boolean
  end
end
