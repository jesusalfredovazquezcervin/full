class AddActiveToReport < ActiveRecord::Migration
  def change
    add_column :reports, :active, :boolean
  end
end
