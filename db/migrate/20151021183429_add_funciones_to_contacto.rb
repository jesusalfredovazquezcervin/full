class AddFuncionesToContacto < ActiveRecord::Migration
  def change
    add_column :contactos, :funciones, :string
  end
end
