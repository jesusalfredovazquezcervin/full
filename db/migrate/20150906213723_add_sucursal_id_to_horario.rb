class AddSucursalIdToHorario < ActiveRecord::Migration
  def change
    add_column :horarios, :sucursal_id, :integer
  end
end
