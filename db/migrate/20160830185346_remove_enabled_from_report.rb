class RemoveEnabledFromReport < ActiveRecord::Migration
  def change
    remove_column :reports, :enabled, :boolean
  end
end
