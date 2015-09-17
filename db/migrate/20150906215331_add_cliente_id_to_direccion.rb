class AddClienteIdToDireccion < ActiveRecord::Migration
  def change
    add_column :direccions, :cliente_id, :integer
  end
end
