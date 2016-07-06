class ChangeDataTypeQuation < ActiveRecord::Migration
  def change
    change_column :asks, :answer, :text
  end
end
