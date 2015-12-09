class AddTipocambiodecimalesToCliente < ActiveRecord::Migration
  def change
    remove_column :clientes, :tipoCambio
    add_column :clientes, :tipoCambio, :decimal, precision: 6, scale: 4
  end
end
