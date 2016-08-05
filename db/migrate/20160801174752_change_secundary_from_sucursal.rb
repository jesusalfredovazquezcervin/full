class ChangeSecundaryFromSucursal < ActiveRecord::Migration
  def change
    rename_column :sucursals, :secundary_id, :secondary_id
  end
end
