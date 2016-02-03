class AddRequiredToStep < ActiveRecord::Migration
  def change
    add_column :steps, :required, :boolean
  end
end
