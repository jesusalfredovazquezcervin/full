class AddFormapagoIdToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :formapago_id, :integer
  end
end
