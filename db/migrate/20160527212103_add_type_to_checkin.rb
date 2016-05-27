class AddTypeToCheckin < ActiveRecord::Migration
  def change
    add_column :checkins, :kind, :string
  end
end
