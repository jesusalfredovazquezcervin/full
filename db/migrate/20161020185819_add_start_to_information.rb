class AddStartToInformation < ActiveRecord::Migration
  def change
    add_column :information, :start_call, :datetime
    add_column :information, :end_call, :datetime
  end
end
