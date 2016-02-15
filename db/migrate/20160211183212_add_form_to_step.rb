class AddFormToStep < ActiveRecord::Migration
  def change
    add_column :steps, :form, :boolean
  end
end
