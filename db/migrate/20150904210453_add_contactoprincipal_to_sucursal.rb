class AddContactoprincipalToSucursal < ActiveRecord::Migration
  def change
    add_column :sucursals, :contactoprincipal_id, :integer
  end
end
