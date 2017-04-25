class AddUserUpdateToInformation < ActiveRecord::Migration
  def change
    add_column :information, :userupdate_id, :integer
  end
end
