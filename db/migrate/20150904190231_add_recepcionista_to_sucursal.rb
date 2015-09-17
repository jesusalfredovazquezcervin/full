class AddRecepcionistaToSucursal < ActiveRecord::Migration
  def change
    add_column :sucursals, :recepcionista_id, :integer
  end
end
