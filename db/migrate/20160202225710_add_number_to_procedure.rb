class AddNumberToProcedure < ActiveRecord::Migration
  def change
    add_column :procedures, :number, :integer
  end
end
