class RemoveField11ToInformation < ActiveRecord::Migration
  def change
    remove_column :information, :field11, :string
  end
end
