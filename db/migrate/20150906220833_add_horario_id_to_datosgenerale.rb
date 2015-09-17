class AddHorarioIdToDatosgenerale < ActiveRecord::Migration
  def change
    add_column :datosgenerales, :horario_id, :integer
  end
end
