class ChangeColumnNameContactoPrincipal < ActiveRecord::Migration
  def change
    rename_column :sucursals, :contactoprincipal_id, :main_id
    rename_column :sucursals, :contactosecundario_id, :secundary_id
  end
end
