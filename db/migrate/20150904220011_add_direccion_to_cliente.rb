class AddDireccionToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :direccion_id, :integer
  end
end
