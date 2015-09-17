class AddSucursalIdToContacto < ActiveRecord::Migration
  def change
    add_column :contactos, :sucursal_id, :integer
  end
end
