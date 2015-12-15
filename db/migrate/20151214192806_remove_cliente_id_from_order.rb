class RemoveClienteIdFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :cliente_id
  end
end
