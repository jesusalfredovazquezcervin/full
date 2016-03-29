class AddField11againToInformation < ActiveRecord::Migration
  def change
    add_column :information, :field11, :string
  end
end
