class AddContactosecundarioToSucursal < ActiveRecord::Migration
  def change
    add_column :sucursals, :contactosecundario_id, :integer
  end
end
