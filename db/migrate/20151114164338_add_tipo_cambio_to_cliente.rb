class AddTipoCambioToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :tipoCambio, :decimal, precision: 4, scale: 2
  end
end
