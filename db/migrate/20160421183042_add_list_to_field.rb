class AddListToField < ActiveRecord::Migration
  def change
    add_column :fields, :list, :string
  end
end
