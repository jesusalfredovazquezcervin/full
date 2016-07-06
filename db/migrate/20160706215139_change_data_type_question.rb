class ChangeDataTypeQuestion < ActiveRecord::Migration
  def change
    change_column :asks, :question, :text
  end
end
