class AddClienteIdToHorario < ActiveRecord::Migration
  def change
    add_column :horarios, :cliente_id, :integer
  end
end
