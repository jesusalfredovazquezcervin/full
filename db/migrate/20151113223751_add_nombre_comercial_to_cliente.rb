class AddNombreComercialToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :nombreComercial, :string
  end
end
