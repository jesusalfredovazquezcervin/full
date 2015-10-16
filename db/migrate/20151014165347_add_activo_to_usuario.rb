class AddActivoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :activo, :boolean, :default => true
  end
end
