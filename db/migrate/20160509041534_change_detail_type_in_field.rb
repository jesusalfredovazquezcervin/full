class ChangeDetailTypeInField < ActiveRecord::Migration
  def change
    change_column :steps, :detail, :text
  end
end
