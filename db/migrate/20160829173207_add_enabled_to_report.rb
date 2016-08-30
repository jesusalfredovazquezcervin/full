class AddEnabledToReport < ActiveRecord::Migration
  def change
    add_column :reports, :enabled, :boolean
  end
end
