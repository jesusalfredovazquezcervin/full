class AddSendToProcedure < ActiveRecord::Migration
  def change
    add_column :procedures, :deliver, :boolean, :default => false
  end
end
