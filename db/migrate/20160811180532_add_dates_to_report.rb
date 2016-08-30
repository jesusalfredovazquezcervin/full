class AddDatesToReport < ActiveRecord::Migration
  def change
    add_column :reports, :start_day, :datetime
    add_column :reports, :end_day, :datetime
  end
end
